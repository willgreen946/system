WWW_HOME='https://searx.ir'
export WWW_HOME

function nonzero_return() {
		RETVAL=$?
		[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

export PS1="\[\e[31m\][\[\e[m\]\[\e[35m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[36m\]\h\[\e[m\] \[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[32m\]\w\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] "
