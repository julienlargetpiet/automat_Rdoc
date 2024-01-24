#/bin/sh

path_2=$(pwd)

path_2b=$(pwd)

frm=$(dirname ${BASH_SOURCE[0]})/

pdf_out="yes"

html_out="yes"

md_out="yes"

while getopts ":i:p:h:m:" options
do

        case "${options}" in

                m)

                        md_out=${OPTARG}

                        ;;

                p)

                        pdf_out=${OPTARG}

                        ;;

                h)

                        html_out=${OPTARG}

                        ;;

                i)

                        path_2=${OPTARG}

                        ;;


                :)

                        echo "options is '-i' for path"
                        
                        exit 1

                        ;;

                *)

                        echo "options is '-i', for path"

                        exit 1

                        ;;


        esac

done

if [ $pdf_out = "yes" ]; then

        R CMD Rd2pdf --force $path_2

fi

touch $path_2/fun.txt

doc_path=$path_2/man/

ls ${doc_path}*.Rd > $path_2/fun.txt

if [ $html_out = "yes" ]; then

        if [ ! -f $path_2/README.html ]; then 

                touch $path_2/README.html

        else

                echo "" > $path_2/README.html

        fi

        hmn=$(ls ${doc_path}*.Rd | wc -l)

        for i in $(seq 1 $hmn)
        do

                fun=$(sed -n "${i}p" < $path_2/fun.txt)

                echo "generating html for $fun"

                out="$(echo $fun | cut -d "." -f 1-1).html"

                R CMD Rdconv --type=html $fun -o $out

                cat $out >> $path_2/README.html

                rm $out

        done

fi

if [ $md_out = "yes" ]; then

        echo ${doc_path} > $path_2b/loc.txt

        if [ ! -f $path_2/README.md ]; then 

                touch $path_2/README.md

        else

                echo "" > $path_2/README.md

        fi

        Rscript ${frm}convert_md.R

        rm $path_2b/loc.txt

fi

rm $path_2/fun.txt

