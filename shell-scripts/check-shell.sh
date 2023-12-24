
columnX () {
    awk "{print \$$1}"
}
rowX () {
    awk "NR==$1"
}

checkShell() {
    ps -p $$ | columnX 4 | rowX 2 | tr -d - 
    # produces bash or zsh (or other shell name like fish)
}

showMethodName(){
    # checkShell && echo ${FUNCNAME[0]} || echo $funcstack[1] 
    checkShell
}
showMethodName
