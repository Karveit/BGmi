_bgmi() {
    local pre cur action
    local actions bangumi config
    actions="{{ ' '.join(actions) }}"
    bangumi="{{' '.join(bangumi)}}"
    config="{{' '.join(config)}}"
    COMPREPLY=()
    #${COMP_WORDS[0]} if bgmi
    # echo "$COMP_CWORD"

    pre=${COMP_WORDS[COMP_CWORD-1]}
    cur=${COMP_WORDS[COMP_CWORD]}
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $( compgen -W "$actions" -- $cur ) )
    else
        action=${COMP_WORDS[1]}

        case "$action" in 
            add|filter|mark|update|fetch )
            COMPREPLY=( $( compgen -W "$bangumi" -- $cur ) )
            return 0
            ;;
            config )

            COMPREPLY=( $( compgen -W "$config" -- $cur ) )
            return 0
            ;;

            cal )
            local opts
            opts="{{' '.join(actions_and_opts['cal'])}}"
            COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
            return 0
            ;;

            source )
            local source
            source="{{' '.join(source)}}"
            COMPREPLY=( $( compgen -W "$source" -- $cur ) )
            return 0
            ;;

            search )
            local opts
            opts="{{' '.join(actions_and_opts['search'])}}"
            COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
            return 0
            ;;

            download )
            local opts
            opts="{{' '.join(actions_and_opts['download'])}}"
            COMPREPLY=( $( compgen -W "$opts" -- $cur ) )
            return 0
            ;;

        esac

    fi

    # add                 Subscribe bangumi.
    # delete              Unsubscribe bangumi.
    # filter              Set bangumi fetch filter.
    # update              Update bangumi calendar and subscribed bangumi
    # mark                Mark bangumi episode.
    # fetch               Fetch bangumi.

}
complete -F _bgmi bgmi
# run `eval "$(bgmi complete)"` in your bash
# zsh support will come later
