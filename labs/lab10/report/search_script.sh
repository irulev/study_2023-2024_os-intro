hile getopts ":i:o:p:Cn" opt; do
    case $opt in
        i) inputfile=$OPTARG ;;
        o) outputfile=$OPTARG ;;
        p) pattern=$OPTARG ;;
        C) case_sensitive=1 ;;
        n) line_numbers=1 ;;
        \?) echo "Неверный ключ: -$OPTARG" >&2
            exit 1 ;;
    esac
done

if [ -z "$pattern" ]; then
    echo "Необходимо указать ключ -p для задания шаблона поиска."
    exit 1
fi

if [ -n "$inputfile" ]; then
    if [ -n "$case_sensitive" ]; then
        if [ -n "$line_numbers" ]; then
            grep -n "$pattern" "$inputfile"
        else
            grep "$pattern" "$inputfile"
        fi
    else
        if [ -n "$line_numbers" ]; then
            grep -in "$pattern" "$inputfile"
        else
            grep -i "$pattern" "$inputfile"
        fi
    fi
else
    echo "Не указан входной файл для поиска."
    exit 1
fi

if [ -n "$outputfile" ]; then
    if [ -n "$case_sensitive" ]; then
        if [ -n "$line_numbers" ]; then
            grep -n "$pattern" "$inputfile" > "$outputfile"
        else
            grep "$pattern" "$inputfile" > "$outputfile"
        fi
    else
        if [ -n "$line_numbers" ]; then
            grep -in "$pattern" "$inputfile" > "$outputfile"
        else
            grep -i "$pattern" "$inputfile" > "$outputfile"
        fi
    fi
fi
