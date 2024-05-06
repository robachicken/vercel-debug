Commands to run:

## Linux: 
    read domain\?"Enter Affected Domain: " && curl https://raw.githubusercontent.com/robachicken/test-ping/main/linux.sh | bash -s $domain | tee vercel-debug.txt

## Windows: 
    Invoke-RestMethod -Uri https://raw.githubusercontent.com/robachicken/test-ping/main/windows.ps1 | Invoke-Expression | tee vercel-debug.txt
