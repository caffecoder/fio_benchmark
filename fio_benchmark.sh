#/bin/sh

work_dir="/tmp/fio"
sections="rand-write-4k rand-write-64k rand-write-512k seq-write-4k seq-write-64k seq-write-512k rand-read-4k rand-read-64k rand-read-512k seq-read-4k seq-read-64k seq-read-512k"

if [ -d $work_dir ]; then
    rm -r $work_dir
fi

for sect in $sections; do
    echo
    echo "Running ${sect}:"
    echo "--------------------------------------------------------------------------------"
    mkdir $work_dir
    fio --section=$sect --output="result_${sect}.txt" benchmark.fio
    rm -r $work_dir
    echo
done
