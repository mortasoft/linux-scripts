#  descargar.sh
#  
#  Copyright 2016 Mario Zamora <mortasoft@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  
#!/bin/bash

if [ $1 = "-d" ]; then
   youtube-dl --extract-audio --audio-format mp3 --audio-quality 128K $2
else
  while IFS='' read -r line || [[ -n "$line" ]]; do
    youtube-dl --extract-audio --audio-format mp3 --audio-quality 128K $line
done < "$1"
fi



