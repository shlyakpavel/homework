#!/bin/bash
echo "<html><head><meta charset=\"UTF-8\"></head><body>" > $2
csvtool format '<h2>%(2)</h2> %(4)\n' "$1" >> $2
echo "</body></html>" >> $2
