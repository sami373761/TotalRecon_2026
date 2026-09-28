#!/bin/bash
show_menus() {
	clear
        echo -e "${GREEN}\

#######                            ######                              
   #     ####  #####   ##   #      #     # ######  ####   ####  #    # 
   #    #    #   #    #  #  #      #     # #      #    # #    # ##   # 
   #    #    #   #   #    # #      ######  #####  #      #    # # #  # 
   #    #    #   #   ###### #      #   #   #      #      #    # #  # # 
   #    #    #   #   #    # #      #    #  #      #    # #    # #   ## 
   #     ####    #   #    # ###### #     # ######  ####   ####  #    # 
                                                                       

        ${SET}"
    echo -e "${CYAN}TotalRecon will install all the recon tools you need${SET}"
    echo "Tools:"
    echo "   0. Install dependencies [GO, Python3, Chromium, etc]"
    echo "   1. Fast web fuzzer (ffuf)"
    echo "   2. Dirsearch"
    echo "   3. Findomain"
    echo "   4. Masscan"
    echo "   5. Nmap"
    echo "   6. Amass"
    echo "   7. MassDNS"
    echo "   8. Nuclei"
    echo "   9. Katana"
    echo "  10. Feroxbuster"
    echo "  11. Dnsx"
    echo "  12. Naabu"
    echo "  13. Subfinder"
    echo "  14. Httpx"
    echo "  15. Gau"
    echo "  16. Subzy"
    echo "  17. Gitleaks"
    echo "  18. Gowitness"
    echo -e "\n\n  88. Install all tools"
    echo -e "  99. Exit\n"
    echo -e "${CYAN}Type /help for a summary of all tools, or /help <number> (e.g., /help 1) for details on a specific tool.${SET}\n"
}

read_option(){
	local choice arg
	read -p "Enter choice [ 1 - 99] " choice arg
	case $choice in
        /help) show_help $arg ;;
        0) install_dependencies ;;
	1) install_ffuf ;;
	2) install_dirsearch ;;
	3) install_findomain ;;
	4) install_masscan ;;
	5) install_nmap ;;
	6) install_amass ;;
	7) install_massdns ;;
	8) install_nuclei ;;
	9) install_katana ;;
	10) install_feroxbuster ;;
        11) install_dnsx ;;
        12) install_naabu ;;
        13) install_subfinder ;;
        14) install_httpx ;;
        15) install_gau ;;
        16) install_subzy ;;
        17) install_gitleaks ;;
        18) install_gowitness ;;
        88) install_all ;;
	99) exit 0;;
	*) echo -e "${RED}Error...${SET}" && sleep 2
	esac
}

show_help() {
    case $1 in
    "")
        echo -e "${CYAN}TotalRecon tools summary${SET}\n"
        echo -e "${GREEN}   0. Install dependencies${SET} - Go, Python3 with pipx, Chromium and the build tools every other option needs."
        echo -e "${GREEN}   1. ffuf${SET} - Fast web fuzzer for directories, files, parameters and virtual hosts."
        echo -e "${GREEN}   2. Dirsearch${SET} - Python web path brute forcer with rich filtering and report output."
        echo -e "${GREEN}   3. Findomain${SET} - Quick subdomain finder that queries dozens of passive sources."
        echo -e "${GREEN}   4. Masscan${SET} - Internet scale TCP port scanner with its own packet engine."
        echo -e "${GREEN}   5. Nmap${SET} - Port scanner and service fingerprinter with a scripting engine."
        echo -e "${GREEN}   6. Amass${SET} - OWASP attack surface mapping and in depth asset discovery."
        echo -e "${GREEN}   7. MassDNS${SET} - High performance DNS resolver for bulk name resolution."
        echo -e "${GREEN}   8. Nuclei${SET} - Template based scanner for known issues and misconfigurations."
        echo -e "${GREEN}   9. Katana${SET} - Crawler that maps endpoints, parameters and JavaScript files."
        echo -e "${GREEN}  10. Feroxbuster${SET} - Recursive content discovery tool written in Rust."
        echo -e "${GREEN}  11. Dnsx${SET} - Fast DNS toolkit for bulk resolution and record queries."
        echo -e "${GREEN}  12. Naabu${SET} - Fast port scanner built for large host lists."
        echo -e "${GREEN}  13. Subfinder${SET} - Passive subdomain enumeration from many public sources."
        echo -e "${GREEN}  14. Httpx${SET} - Fast HTTP prober that finds the live hosts in a target list."
        echo -e "${GREEN}  15. Gau${SET} - Fetches known URLs from Wayback, Common Crawl, OTX and URLScan."
        echo -e "${GREEN}  16. Subzy${SET} - Subdomain takeover checker based on service fingerprints."
        echo -e "${GREEN}  17. Gitleaks${SET} - Secret scanner for git history, files and directories."
        echo -e "${GREEN}  18. Gowitness${SET} - Headless Chrome screenshotter for triaging web hosts."
        echo -e "\n${GREEN}  88. Install all tools${SET} - Runs every installer above in order, plus aquatone."
        echo
        ;;
    0)
        echo -e "${GREEN}0. Install dependencies ${SET}\n"
        echo "Installs everything the other tools build against or run on through apt-get: the Go"
        echo "toolchain, Python3 with pipx, Chromium, jq, curl, git, nmap and the build tools that"
        echo "masscan and massdns need in order to compile."
        echo "It also creates $HOME/tools and $HOME/.local/bin, then adds $HOME/go/bin and"
        echo "$HOME/.local/bin to your PATH. Run this option once before installing any tool."
        echo
        ;;
    1)
        echo -e "${GREEN}1. ffuf - Fast web fuzzer ${SET}\n"
        echo "Fast web fuzzer written in Go. Point it at a URL containing the FUZZ keyword and give it a"
        echo "wordlist to brute force directories, files, GET or POST parameters and virtual hosts."
        echo "In a pipeline it runs after httpx has confirmed which hosts are alive, to expand each one"
        echo "into a list of real endpoints."
        echo
        ;;
    2)
        echo -e "${GREEN}2. Dirsearch ${SET}\n"
        echo "Python command line tool for brute forcing web paths. It ships with its own wordlists and"
        echo "understands extensions, status code filtering and several report formats."
        echo "Use it as an alternative or a second pass to ffuf when you want richer filtering and a"
        echo "saved report of what was found."
        echo
        ;;
    3)
        echo -e "${GREEN}3. Findomain ${SET}\n"
        echo "Subdomain enumerator that queries dozens of passive sources and certificate transparency"
        echo "logs. It is one of the quickest ways to turn a root domain into a large candidate list."
        echo "Run it at the very start of recon alongside subfinder and amass, then merge and"
        echo "deduplicate all three result sets."
        echo
        ;;
    4)
        echo -e "${GREEN}4. Masscan ${SET}\n"
        echo "Asynchronous TCP port scanner with its own packet transmission engine, able to sweep huge"
        echo "address ranges at very high rates. It only reports that a port is open, not what is behind it."
        echo "Typical use is a wide sweep across an entire netblock, then handing the open ports to nmap"
        echo "for accurate service detection."
        echo
        ;;
    5)
        echo -e "${GREEN}5. Nmap ${SET}\n"
        echo "The reference port scanner for service and version fingerprinting, OS detection and scripted"
        echo "checks through the NSE engine. It is slower than masscan or naabu but far more accurate."
        echo "In a pipeline it is the deep second stage, run only against the ports a fast scanner has"
        echo "already flagged as open."
        echo
        ;;
    6)
        echo -e "${GREEN}6. Amass ${SET}\n"
        echo "OWASP project for attack surface mapping and asset discovery. It combines passive sources,"
        echo "brute forcing, certificate data, ASN and reverse DNS lookups into one graph of the target."
        echo "It is the most thorough subdomain tool in this list and the slowest, so run it once per"
        echo "engagement rather than on every pass."
        echo
        ;;
    7)
        echo -e "${GREEN}7. MassDNS ${SET}\n"
        echo "High performance DNS stub resolver built to resolve millions of names against a list of"
        echo "public resolvers. It is the engine behind subdomain brute forcing at scale."
        echo "Feed it a generated candidate wordlist and it returns only the names that actually resolve,"
        echo "which keeps the rest of the pipeline small."
        echo
        ;;
    8)
        echo -e "${GREEN}8. Nuclei ${SET}\n"
        echo "Template driven scanner that checks targets against thousands of community YAML templates"
        echo "covering known CVEs, exposed panels, default credentials and misconfigurations."
        echo "Templates keep it fast to run and easy to extend with your own checks. It is usually the"
        echo "last stage of the pipeline, fed the live URLs collected by httpx and katana."
        echo
        ;;
    9)
        echo -e "${GREEN}9. Katana ${SET}\n"
        echo "Crawler that walks a web application and collects endpoints, parameters, forms and"
        echo "JavaScript files, with an optional headless mode for JavaScript heavy sites."
        echo "It turns a single live host into a detailed map of its surface, and its output feeds"
        echo "straight into ffuf for parameter fuzzing and nuclei for vulnerability checks."
        echo
        ;;
    10)
        echo -e "${GREEN}10. Feroxbuster ${SET}\n"
        echo "Recursive content discovery tool written in Rust, designed to keep descending into every"
        echo "directory it finds. It handles recursion depth and filtering well and can resume a scan."
        echo "Reach for it when you want deep recursive directory discovery rather than the single flat"
        echo "wordlist pass that ffuf does by default."
        echo
        ;;
    11)
        echo -e "${GREEN}11. Dnsx ${SET}\n"
        echo "Fast and flexible DNS toolkit for bulk resolution and for querying specific record types"
        echo "such as A, CNAME, MX and TXT. It also filters wildcard responses."
        echo "Use it to validate and enrich the raw names produced by subfinder, findomain and amass so"
        echo "that only real hosts move further down the pipeline."
        echo
        ;;
    12)
        echo -e "${GREEN}12. Naabu ${SET}\n"
        echo "Fast SYN and CONNECT port scanner built for running over large host lists rather than raw"
        echo "netblocks. It is designed to chain with other tools and can pass results into nmap."
        echo "Use it to find which ports are open across every subdomain you discovered, before spending"
        echo "time on deeper scans."
        echo
        ;;
    13)
        echo -e "${GREEN}13. Subfinder ${SET}\n"
        echo "Passive subdomain enumeration tool that queries a large set of public sources and APIs."
        echo "Because it never touches the target directly it is both quiet and quick."
        echo "It is the usual first command in a recon pipeline and pairs well with findomain and amass"
        echo "for wider coverage."
        echo
        ;;
    14)
        echo -e "${GREEN}14. Httpx ${SET}\n"
        echo "Fast multi purpose HTTP prober that reports which hosts in a list actually serve a web"
        echo "server, along with status codes, titles, technologies and redirects."
        echo "It is the filter that turns a huge subdomain list into a short list of live targets, and"
        echo "almost every later stage from katana to nuclei takes its output as input."
        echo
        ;;
    15)
        echo -e "${GREEN}15. Gau - get all urls ${SET}\n"
        echo "Pulls known URLs for a domain out of the Wayback Machine, Common Crawl, Open Threat"
        echo "Exchange and URLScan, without sending any traffic to the target."
        echo "Because the data is historical it surfaces old endpoints and parameters that no live"
        echo "crawler would reach, which makes it a good partner to katana."
        echo
        ;;
    16)
        echo -e "${GREEN}16. Subzy ${SET}\n"
        echo "Subdomain takeover checker that compares the response of each subdomain against a set of"
        echo "service fingerprints, flagging CNAMEs that point at unclaimed cloud services."
        echo "Run it over your resolved subdomain list right after dnsx to catch dangling records while"
        echo "they are still claimable."
        echo
        ;;
    17)
        echo -e "${GREEN}17. Gitleaks ${SET}\n"
        echo "Secret scanner that looks for API keys, tokens and credentials in git history, files and"
        echo "directories. Because it reads the full commit history it finds secrets that were committed"
        echo "once and later removed."
        echo "Use it against any repository belonging to the target that turns up during recon."
        echo
        ;;
    18)
        echo -e "${GREEN}18. Gowitness ${SET}\n"
        echo "Headless Chrome screenshot tool that renders every URL in a list and stores the images"
        echo "with their headers and metadata in a local database."
        echo "Screenshots let you triage hundreds of live hosts visually in minutes, so run it over the"
        echo "httpx output to spot login panels, default installs and forgotten admin interfaces."
        echo
        ;;
    88)
        echo -e "${GREEN}88. Install all tools ${SET}\n"
        echo "Runs every installer in this menu one after another in pipeline order, plus aquatone,"
        echo "which is installed here but has no menu number of its own."
        echo "Each tool pauses once it finishes, so you press Enter between them. Install the"
        echo "dependencies with option 0 first or most of these installs will fail."
        echo
        ;;
    *)
        echo -e "${RED}Error...${SET}"
        ;;
    esac
    pause
}

pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}
 
load_colors() {
    # https://www.shellhacks.com/bash-colors/
    DARKGRAY='\033[1;30m'
    RED='\033[0;31m'    
    LIGHTRED='\033[1;31m'
    GREEN='\033[0;32m'    
    YELLOW='\033[1;33m'
    BLUE='\033[0;34m'    
    PURPLE='\033[0;35m'    
    LIGHTPURPLE='\033[1;35m'
    CYAN='\033[0;36m'    
    WHITE='\033[1;37m'
    SET='\033[0m'
}

install_dependencies() {
    echo -e "${GREEN}Installing tools' dependencies ${SET}"
    sudo add-apt-repository ppa:longsleep/golang-backports
    sudo apt-get update && sudo apt-get -y upgrade
    sudo apt-get install -y golang-go build-essential python3 python3-dev wget unzip chromium-browser gcc make libpcap-dev python3-pip pipx jq curl git nmap
    mkdir -p $HOME/tools $HOME/.local/bin
    add_to_path
    echo -e "${YELLOW}Finished installing tools' dependencies ${SET}\n"
    pause
}

install_ffuf() {
    # https://github.com/ffuf/ffuf
    echo -e "${GREEN}Installing Fast web fuzzer (ffuf) ${SET}"
    go install github.com/ffuf/ffuf/v2@latest
    echo -e "${YELLOW}Finished installing Fast web fuzzer (ffuf) ${SET}\n"
    pause
}

install_findomain() {
    # https://github.com/Findomain/Findomain
    echo -e "${GREEN}Installing findomain ${SET}"
    FINDOMAIN_URL=$(curl -s https://api.github.com/repos/findomain/findomain/releases/latest | jq -r '.assets[] | select(.name == "findomain-linux.zip") | .browser_download_url')
    wget $FINDOMAIN_URL -O $HOME/tools/findomain.zip
    cd $HOME/tools && unzip findomain.zip -d $HOME/tools/findomain && mv $HOME/tools/findomain/findomain $HOME/.local/bin
    chmod +x $HOME/.local/bin/findomain
    rm -r $HOME/tools/findomain && rm $HOME/tools/findomain.zip
    echo -e "${YELLOW}Finished installing findomain ${SET}\n"
    pause

}


install_dirsearch() {
    echo -e "${GREEN}Installing dirsearch ${SET}"
    pipx install dirsearch
    echo -e "${YELLOW}Finished installing dirsearch ${SET}\n"
    pause
}

install_aquatone() {
    # https://github.com/michenriksen/aquatone
    echo -e "${GREEN}Installing aquatone ${SET}"
    AQUATONE_URL=$(curl -s https://api.github.com/repos/michenriksen/aquatone/releases/latest | jq -r '.assets[] | select(.name | test("linux_amd64")) | .browser_download_url')
    wget $AQUATONE_URL -O $HOME/tools/aquatone.zip
    cd $HOME/tools && unzip aquatone.zip -d $HOME/tools/aquatone && mv $HOME/tools/aquatone/aquatone $HOME/.local/bin
    chmod +x $HOME/.local/bin/aquatone
    rm -r $HOME/tools/aquatone && rm $HOME/tools/aquatone.zip
    echo -e "${YELLOW}Finished installing aquatone ${SET}\n"
    pause
}

install_masscan() {
    # https://github.com/robertdavidgraham/masscan
    echo -e "${GREEN}Installing masscan ${SET}"
    git clone https://github.com/robertdavidgraham/masscan $HOME/tools/masscan
    cd $HOME/tools/masscan && make -j && mv $HOME/tools/masscan/bin/masscan $HOME/.local/bin
    rm -r $HOME/tools/masscan
    echo -e "${YELLOW}Finished installing masscan ${SET}\n"
    pause
}


install_amass() {
    # https://github.com/OWASP/Amass
    echo -e "${GREEN}Installing Amass ${SET}"
    go install github.com/owasp-amass/amass/v5/cmd/amass@latest
    echo -e "${YELLOW}Finished installing Amass ${SET}\n"
    pause
}

install_nmap() {
    # https://github.com/OWASP/Amass
    echo -e "${GREEN}Installing Nmap ${SET}"
    sudo apt-get install -y nmap
    echo -e "${YELLOW}Finished installing Nmap ${SET}\n"
    pause
}

install_massdns() {
    # https://github.com/blechschmidt/massdns
    echo -e "${GREEN}Installing MassDNS ${SET}"
    git clone https://github.com/blechschmidt/massdns.git $HOME/tools/massdns
    cd $HOME/tools/massdns && make && mv $HOME/tools/massdns/bin/massdns $HOME/.local/bin
    echo -e "${YELLOW}Finished installing MassDNS ${SET}\n"
    pause
}

install_nuclei() {
    echo -e "${GREEN}Installing nuclei ${SET}"
    go install github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
    echo -e "${YELLOW}Finished installing nuclei ${SET}\n"
    pause
}

install_katana() {
    echo -e "${GREEN}Installing katana ${SET}"
    go install github.com/projectdiscovery/katana/cmd/katana@latest
    echo -e "${YELLOW}Finished installing katana ${SET}\n"
    pause
}

install_feroxbuster() {
    echo -e "${GREEN}Installing feroxbuster ${SET}"
    FEROXBUSTER_URL=$(curl -s https://api.github.com/repos/epi052/feroxbuster/releases/latest | jq -r '.assets[] | select(.name == "x86_64-linux-feroxbuster.zip") | .browser_download_url')
    wget $FEROXBUSTER_URL -O $HOME/tools/feroxbuster.zip
    cd $HOME/tools && unzip feroxbuster.zip -d $HOME/tools/feroxbuster && mv $HOME/tools/feroxbuster/feroxbuster $HOME/.local/bin
    chmod +x $HOME/.local/bin/feroxbuster
    rm -r $HOME/tools/feroxbuster && rm $HOME/tools/feroxbuster.zip
    echo -e "${YELLOW}Finished installing feroxbuster ${SET}\n"
    pause
}

install_dnsx() {
    echo -e "${GREEN}Installing dnsx ${SET}"
    go install github.com/projectdiscovery/dnsx/cmd/dnsx@latest
    echo -e "${YELLOW}Finished installing dnsx ${SET}\n"
    pause
}

install_naabu() {
    echo -e "${GREEN}Installing naabu ${SET}"
    go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
    echo -e "${YELLOW}Finished installing naabu ${SET}\n"
    pause
}

install_subfinder() {
    echo -e "${GREEN}Installing subfinder ${SET}"
    go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
    echo -e "${YELLOW}Finished installing subfinder ${SET}\n"
    pause
}

install_httpx() {
    echo -e "${GREEN}Installing httpx ${SET}"
    go install github.com/projectdiscovery/httpx/cmd/httpx@latest
    echo -e "${YELLOW}Finished installing httpx ${SET}\n"
    pause
}

install_gau() {
    echo -e "${GREEN}Installing gau ${SET}"
    go install github.com/lc/gau/v2/cmd/gau@latest
    echo -e "${YELLOW}Finished installing gau ${SET}\n"
    pause
}

install_subzy() {
    echo -e "${GREEN}Installing subzy ${SET}"
    go install github.com/PentestPad/subzy@latest
    echo -e "${YELLOW}Finished installing subzy ${SET}\n"
    pause
}

install_gitleaks() {
    echo -e "${GREEN}Installing gitleaks ${SET}"
    go install github.com/zricethezav/gitleaks/v8@latest
    echo -e "${YELLOW}Finished installing gitleaks ${SET}\n"
    pause
}

install_gowitness() {
    echo -e "${GREEN}Installing gowitness ${SET}"
    go install github.com/sensepost/gowitness@latest
    echo -e "${YELLOW}Finished installing gowitness ${SET}\n"
    pause
}

add_to_path() {
    PATH_EXPORT='export PATH=$PATH:$HOME/go/bin:$HOME/.local/bin'
    for SHELL_RC in $HOME/.bashrc $HOME/.zshrc; do
        touch $SHELL_RC
        if grep -qF "$PATH_EXPORT" $SHELL_RC; then
            echo -e "${RED}Tools' dirs already in $SHELL_RC${SET}"
        else
            echo "$PATH_EXPORT" >> $SHELL_RC
            echo -e "${GREEN}Added tools' dirs to $SHELL_RC ${SET}"
        fi
    done
    export PATH=$PATH:$HOME/go/bin:$HOME/.local/bin
}

install_all () {
    install_ffuf
    install_findomain
    install_dirsearch
    install_aquatone
    install_masscan
    install_amass
    install_nmap
    install_massdns
    install_nuclei
    install_katana
    install_feroxbuster
    install_dnsx
    install_naabu
    install_subfinder
    install_httpx
    install_gau
    install_subzy
    install_gitleaks
    install_gowitness
    pause
}

trap '' SIGINT SIGQUIT SIGTSTP

while true
do
    load_colors
    show_menus
    read_option
done
