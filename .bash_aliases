## usefull bash aliases ##


# about ls
alias ll='ls -alf'
alias la='ls -A'
alias l='ls -ltrhA'
alias ..='cd ../'
alias ...='cd ../..'
alias gl='ls|grep --color'

# Make and change directory at once
alias mkcd='_(){ mkdir -p $1; cd $1; }; _'

# about terminal
alias c='clear'


alias mnt='mount | column -t'
alias h='history'
alias j='jobs -l'


# date
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'


# network
alias ports='netstat -tnulap'

# do not delete / or prompt if deleting more than 3 files at a time #
alias rm='rm -I --preserve-root'

# confirmation #
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
# show progress bar on file copy. Useful evenlocal.
alias cpProgress='rsync --progress -ravz'

# network #
alias ping='ping -c 5'
alias pinga='ping'

# memory, cpu usage, and gpu memory

## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## older system use /proc/cpuinfo ##
##alias cpuinfo='less /proc/cpuinfo' ##

## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# show file without comments
alias nocomment='grep -Ev '\''^(#|$)'\'''

# mount ntfs partition
#alias mountntfs='sudo mount -t ntfs-3g /dev/sda1 /mnt/ntfs'

# umount ntfs partiion
#alias umountntfs='sudo umount /mnt/ntfs'


function extract() {

	if [[ "$#" -lt 1 ]]; then
	  echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
	  return 1 #not enough args
	fi

	if [[ ! -e "$1" ]]; then
	  echo -e "File does not exist!"
	  return 2 # File not found
	fi

	DESTDIR="."

	filename=`basename "$1"`

	case "${filename##*.}" in
	  tar)
		echo -e "Extracting $1 to $DESTDIR: (uncompressed tar)"
		tar xvf "$1" -C "$DESTDIR"
		;;
	  gz)
		echo -e "Extracting $1 to $DESTDIR: (gip compressed tar)"
		tar xvfz "$1" -C "$DESTDIR"
		;;
	  tgz)
		echo -e "Extracting $1 to $DESTDIR: (gip compressed tar)"
		tar xvfz "$1" -C "$DESTDIR"
		;;
	  xz)
		echo -e "Extracting  $1 to $DESTDIR: (gip compressed tar)"
		tar xvf -J "$1" -C "$DESTDIR"
		;;
	  bz2)
		echo -e "Extracting $1 to $DESTDIR: (bzip compressed tar)"
		tar xvfj "$1" -C "$DESTDIR"
		;;
      tbz2)
	  	echo -e "Extracting $1 to $DESTDIR: (tbz2 compressed tar)"
	  	tar xvjf "$1" -C "$DESTDIR"
		;;
	  zip)
		echo -e "Extracting $1 to $DESTDIR: (zipp compressed file)"
		unzip "$1" -d "$DESTDIR"
		;;
	  lzma)
	  	echo -e "Extracting $1 : (lzma compressed file)"
		unlzma "$1"
		;;
	  rar)
		echo -e "Extracting $1 to $DESTDIR: (rar compressed file)"
		unrar x "$1" "$DESTDIR"
		;;
	  7z)
		echo -e  "Extracting $1 to $DESTDIR: (7zip compressed file)"
		7za e "$1" -o "$DESTDIR"
		;;
	  xz)
	  	echo -e  "Extracting $1 : (xz compressed file)"
	    unxz  "$1"
	  	;;
	  exe)
	   	cabextract "$1"
	  	;;
	  *)
		echo -e "Unknown archieve format!"
		return
	  	;;
	esac
}
