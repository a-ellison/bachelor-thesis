for f in ./*.ipe 
do
        filename=$(basename $f)
        filename=${filename%.*}
        ipetoipe -pdf -export $f ../figures/${filename}.pdf
done
