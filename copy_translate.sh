# ./copy_translate.sh ./res ../mobile/src/main/res
if (( $# < 2 )); then
    echo "usage: ./smlink.sh <from /res> <to /res>"
    exit 1
fi

echo "symlink translations from from $1 to $2"
current_dir=$(pwd)
echo "current: $current_dir"

cd $1
current_dir_from=$(pwd)
echo "from: $current_dir_from"

cd $current_dir
cd $2
current_dir_to=$(pwd)
echo "to: $current_dir_to"

cd $current_dir_from
for d in values* ; do
	source_folder="$current_dir_from/$d"
	target_folder="$current_dir_to/$d"

    echo "translation \"$d\""
    
	source_file="$source_folder/strings.xml"
	target_file="$target_folder/strings.xml"

	if [ -f "$source_file" ]; then
	    echo "$source_file exists."
	    
	    if [ ! -d "$target_folder" ]; then
	    	echo "creating folder $target_folder"
			mkdir "$target_folder"
		fi

	    if [ -f "$target_file" ]; then
		    echo "$target_file exists"
		    rm -f $target_file
		fi

		echo "cp $source_file $target_file"
		cp $source_file $target_file
	fi

done

cd $current_dir