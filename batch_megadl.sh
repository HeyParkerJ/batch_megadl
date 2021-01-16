#!/bin/bash

while getopts d:f: flag; do
	case "${flag}" in
		d) destination=${OPTARG};;
		f) file=${OPTARG};;
		*) echo 'error' >&2
			exit 1
	esac
done

  echo "Destination: $destination";
  echo "Input File: $file";

  # TODO - Only do this if the dir is not there
mkdir $destination

while read line; do
  LINK=$line
  SUB="mega.nz"
  BROKEN_LINK_IDENTIFIER="/file/"

  # If this line does not contain a mega.nz link, skip this part of the loop
  if
	  [[ "$LINK" != *"$SUB"* ]]; then
	  echo "No link found on this line: $LINK"
	  continue
  fi

  # Remove anything that comes before 'https'
  LINK=$(echo $LINK | sed 's/^.*\(https\)/https/');

  # Now we need to determine if this link needs to be coerced and do so if needed
  if
	  [[ "$LINK" == *"$BROKEN_LINK_IDENTIFIER"* ]]; then
	  echo "This link needs to be coerced"

	  # Need to replace /file/{restoflink} with /#!{restoflink}
	  replaceHashtag=${LINK/\#/!};

		  echo "Replacing hashtag: ${replaceHashtag}";

	  partToReplace="\/file\/"
	  replaceWith="/#!"
	  LINK=${replaceHashtag/$partToReplace/$replaceWith};
  fi

  echo "FinalLink: $LINK"
  megadl "$LINK" --path=$destination;

done < $file
