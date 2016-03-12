" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    if has('unix')
        execute '!mkdir ~/.vim/autoload && curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    elseif has('win32') "to test => multiline command
        execute '
            !new-item ~\vimfiles\autoload -itemtype directory \
            md ~\vimfiles\autoload \
            $uri = \'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\' \
            (New-Object Net.WebClient).DownloadFile($uri, $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath("~\vimfiles\autoload\plug.vim"))
            '
        endif
endif

