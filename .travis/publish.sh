#cp licenseKey.txt tools/oxygen-publishing-engine-3.x/licensekey.txt

rm -rf output

REPONAME=`basename $PWD`
PARENTDIR=`dirname $PWD`
USERNAME=`basename $PARENTDIR`

# Writes the license key in a file
# Assumes that $LICENSE_KEY contains the license key with all /n's replaced by @@
printf "%s" "$LICENSE_KEY_LF" > tools/oxygen-publishing-engine-3.x/licensekey.txt
#sed -i 's/@@/\n/g' tools/oxygen-publishing-engine-3.x/licensekey.txt


# Send some parameters to the "editlink" plugin as system properties
export ANT_OPTS="$ANT_OPTS"

tools/oxygen-publishing-engine-3.x/bin/dita -i dita/garage/garage.ditamap -f webhelp-responsive -o output/garage -t temp/garage -Dwebhelp.publishing.template.descriptor=material.opt -Dwebhelp.publishing.template=publishing/material/