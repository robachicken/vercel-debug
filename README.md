Commands to run:

## Mac/Linux (Bash/ZSH):
    curl -s https://raw.githubusercontent.com/robachicken/test-ping/main/linux.sh | bash -s $domain | tee vercel-debug.txt

## Windows (Powershell): 
    Invoke-RestMethod -Uri https://raw.githubusercontent.com/robachicken/test-ping/main/windows.ps1 | Invoke-Expression | tee vercel-debug.txt
