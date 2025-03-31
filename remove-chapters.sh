for f in content/*; 
do
        echo $f
        sed -i "s/\\\subsubsection/\\\paragraph/g" $f
        sed -i "s/\\\subsection/\\\subsubsection/g" $f
        sed -i "s/\\\section/\\\subsection/g" $f
        sed -i "s/\\\chapter/\\\section/g" $f
done
