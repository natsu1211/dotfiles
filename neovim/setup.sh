init_target neovim
process_neovim(){
    directory .config/nvim
    ln -sf $HOME/.vim $HOME/.config/nvim
    symlink neovim/init.vim .config/nvim/init.vim
}
