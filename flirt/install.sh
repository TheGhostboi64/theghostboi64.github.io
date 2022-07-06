#!/bin/bash
repoget () {
	curl --create-dirs -f -k -L -o "${2}" -S -s --insecure 
}


PS3="Choose a version to install (extended contains blinking): "

select v in default extended; do
	case $v in
	default) mv flirt.sh	~/.flirt ;;
	extended) mv eflirt.sh	~/.flirt ;;
	*) continue ;;
	esac
	break
done

cd ..
rm -rf flirt

cat << EOF >> .bashrc
PROMPT_COMMAND="prompt=1"
trap 'cmd=\$BASH_COMMAND; \
[[ "\$prompt" && "\$cmd" != "\$PROMPT_COMMAND" ]] && \
~/.flirt; unset prompt' DEBUG
EOF

echo "Installation success, start bash again for the changes to take effect"
