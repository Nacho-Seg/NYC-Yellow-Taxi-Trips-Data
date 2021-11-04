wget https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page

grep -Eo '(http|https)://[^*"]+.csv' tlc-trip-record-data.page | grep "yellow" >> enlaces.txt

while IFS= read -r line
do
 wget "$line"
 awk -F, '{ print $5, $0}' ${line##*/} | tail -n +2 >> all.csv
 rm ${line##*/}
done < enlaces.txt

sort -n all.csv >> sort_1.csv
awk '{$1=""; print $0}' sort_1.csv >> order.csv

total=$(wc -l order.csv | awk '{print $1}')
percentil=0.9
calc=$(echo "$total*$percentil" | bc)
filaPercentil=$(echo $calc | perl -nl -MPOSIX -e 'print ceil($_);')
filaFichero=$(expr $total - $filaPercentil)
tail -n $filaFichero order.csv>> solucion.csv
