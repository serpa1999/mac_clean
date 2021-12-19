i=1
count_of_lines=$(wc -l source_dir.txt | awk '{print $1}')
bytes_on_start=$(du -s /Users/rshor | awk ' {print $1}')
let count_of_lines+=1
while [ $i -le $count_of_lines ]
do
	du /Users/$USER$(sed -n "$i p" source_dir.txt)
	rm -rf /Users/$USER$(sed -n "$i p" source_dir.txt)
	let i+=1
done
while [ $i -ne 0 ]
do
	printf '-'
	let i-=1
donehrome
echo ""
bytes_on_end=$(du -s /Users/rshor | awk ' {print $1}')
echo "
bytes_on_start: $((bytes_on_start /2/1000/1000))GB, ($bytes_on_start KiB)
bytes_on_end:   $((bytes_on_end /2/1000/1000))GB, ($bytes_on_end KiB)
freed:          $(($(($bytes_on_start - $bytes_on_end)) /2/1000/1000))GB, $(( $bytes_on_start - $bytes_on_end )) KiB"