for f in ./*.ipe 
do
        filename=$(basename $f)
        filename=${filename%.*}
        iperender -png -resolution 400 $f ../figures/${filename}.png 
done
