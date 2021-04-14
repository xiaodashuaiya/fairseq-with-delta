dict=cmudict-0.7b

cat $dict | grep ^[a-zA-Z] | grep -v "(.*)" | shuf > dict.filtered

dict=dict.filtered

cat $dict | awk '{print $1}' > words.txt
cat $dict | awk '{$1 = ""; print}' > phones.txt

cat words.txt | sed -e 's/\(.\)/\1 /g' > letters.txt

cat letters.txt > all.de
cat phones.txt  > all.en

for lang in de en; do
  head -n 10000 all.$lang > valid.$lang
  tail -n +10001 all.$lang | head -n 10000 > test.$lang
  tail -n +20001 all.$lang > train.$lang
done

