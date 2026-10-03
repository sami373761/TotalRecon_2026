# Total Recon
  
Total Recon will install all the recon tools you need

Tested on Ubuntu 24.04 LTS (Noble Numbat)


Currently installing:
   1. Fast web fuzzer (ffuf)
   2. Dirsearch
   3. Findomain
   4. Masscan
   5. Nmap
   6. Amass
   7. MassDNS
   8. Nuclei
   9. Katana
  10. Feroxbuster
  11. Dnsx
  12. Naabu
  13. Subfinder
  14. Httpx
  15. Gau
  16. Subzy
  17. Gitleaks
  18. Gowitness

Usage:
``` console
    ubuntu@recon:~$ chmod +x total_recon.sh
    ubuntu@recon:~$ ./total_recon.sh 
    
    #######                            ######                              
       #     ####  #####   ##   #      #     # ######  ####   ####  #    # 
       #    #    #   #    #  #  #      #     # #      #    # #    # ##   # 
       #    #    #   #   #    # #      ######  #####  #      #    # # #  # 
       #    #    #   #   ###### #      #   #   #      #      #    # #  # # 
       #    #    #   #   #    # #      #    #  #      #    # #    # #   ## 
       #     ####    #   #    # ###### #     # ######  ####   ####  #    # 
    
    TotalRecon will install all the recon tools you need
	Tools:
	   0. Install dependencies [GO, Python3, Chromium, etc]
	   1. Fast web fuzzer (ffuf)
	   2. Dirsearch
	   3. Findomain
	   4. Masscan
	   5. Nmap
	   6. Amass
	   7. MassDNS
	   8. Nuclei
	   9. Katana
	  10. Feroxbuster
	  11. Dnsx
	  12. Naabu
	  13. Subfinder
	  14. Httpx
	  15. Gau
	  16. Subzy
	  17. Gitleaks
	  18. Gowitness
	  
	  88. Install all tools
	  99. Exit

	Enter choice [ 1 - 99] 
```

**Note**: You need to install the dependencies before installing the tools.

The tools are installed to $HOME/go/bin and $HOME/.local/bin, both added to the PATH, you can access them from everywhere in the file system.

**Run ```source $HOME/.bashrc``` after running the script, to add tools to PATH.**

## 2026 Modernization Update

The installer has been brought up to date for current distributions and toolchains. The banner, the menu flow and the original function layout are unchanged — what changed is *which* tools are installed, *how* they are fetched, and *where* they land.

### Tool Roster Refresh

The roster moved to the Go and Rust tooling that is actively maintained today.

**Added:** `nuclei`, `katana`, `feroxbuster`, `dnsx`, `naabu`, `subfinder`, `httpx`, `gau`, `subzy`, `gitleaks`, `gowitness`

**Kept:** `ffuf`, `dirsearch`, `findomain`, `masscan`, `nmap`, `amass`, `massdns`

**Removed:** Sublist3r, httprobe, waybackurls, subjack, WhatWeb, gitGraber, LinkFinder, getJS, EyeWitness and meg — each either unmaintained, deprecated, or superseded by a faster equivalent in the list above.

### Safer Package Management

- Go tools are installed with `go install <module>@latest`. Modern Go releases no longer install binaries via `go get`, so every Go install in the old script had quietly stopped working.
- Module paths were corrected in the process: `ffuf` now requires the `/v2` path, and `amass` has moved to `github.com/owasp-amass/amass/v5`.
- Python tools install through `pipx` rather than a global `pip3 install`. Each tool gets its own virtualenv, which respects **PEP 668** and keeps the installer from breaking the system Python that `apt` itself depends on.

### Dynamic Releases

Hardcoded download links and pinned version numbers are gone. Prebuilt binaries — `findomain`, `feroxbuster` and `aquatone` — are now resolved at install time from the GitHub releases API with `jq`:

```console
curl -s https://api.github.com/repos/<owner>/<repo>/releases/latest \
  | jq -r '.assets[] | select(.name == "<linux amd64 asset>") | .browser_download_url'
```

The script keeps working whenever upstream cuts a new release, instead of fetching one frozen tag forever.

### System Integrity

- Dropped `sudo ln -s /usr/bin/python3 /usr/bin/python`. Clobbering a system path like this can break distro packaging.
- Dropped the `sed`-based rewriting of `~/.bash_profile`, which could truncate the file and discard an existing `PATH`.
- `add_to_path` now appends one guarded line to both `~/.bashrc` and `~/.zshrc`, and is safe to run as many times as you like.
- Nothing is copied into `/usr/local/bin` with `sudo` any more. Binaries live in user-owned `$HOME/.local/bin` and `$HOME/go/bin`, leaving `apt-get` as the only step that needs elevation.

### Interactive Help

The prompt now accepts help commands alongside the menu numbers:

| Input | Result |
| --- | --- |
| `/help` | A one-line summary of every option in the menu |
| `/help <number>` | A detailed description of that tool and where it fits in a recon pipeline |

```console
    Enter choice [ 1 - 99] /help 8

    8. Nuclei

    Template driven scanner that checks targets against thousands of community YAML templates
    covering known CVEs, exposed panels, default credentials and misconfigurations.
    Templates keep it fast to run and easy to extend with your own checks. It is usually the
    last stage of the pipeline, fed the live URLs collected by httpx and katana.
```

## Contribution 

Feel free to add more tools so that the Bug Bounty community can benefit from them.

### Thanks

Inspired by [@NahamSec](https://twitter.com/NahamSec)

Thanks for all the tool's developers



