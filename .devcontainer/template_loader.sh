#!/bin/bash

export LATEX_PROJECT_PATH=/latex/project
BackupPath=/tmp/template_backup

Help()
{
   echo "Latex template loader by szyminson."
   echo
   echo "Syntax: template [-s template_name] [-r] [-l]"
   echo "options:"
   echo "-s template_name  Load template with given name."
   echo "-r                Restore last project from backup."
   echo "-l                Display a list of available templates."

   echo
}

while getopts ":s:rl" option; do
   case "${option}" in
      s)
         if [ -z "$OPTARG" ]; then
            echo "No template name provided."
            exit 1
         fi
         Template=$OPTARG
         TemplatePath="/latex/templates/$Template"
         if [ ! -d $TemplatePath ]; then
            echo "No such template: $Template"
            exit 1
         fi
         rm -rf $BackupPath
         cp -a $LATEX_PROJECT_PATH $BackupPath
         rm -rf "$LATEX_PROJECT_PATH/"*
         rm -rf "$LATEX_PROJECT_PATH/".* 2> /dev/null
         cp -rp "$TemplatePath/." $LATEX_PROJECT_PATH
         if [ -f $TemplatePath/${Template}.sh ]; then
            rm $LATEX_PROJECT_PATH/${Template}.sh
            $TemplatePath/${Template}.sh
         fi
         echo "Done!"
         exit;;
      r)
         if [ ! -d $BackupPath ]; then
            echo "No backup available."
            exit 1
         fi
         rm -rf "$LATEX_PROJECT_PATH/"*
         rm -rf "$LATEX_PROJECT_PATH/".* 2> /dev/null
         cp -rp "$BackupPath/." $LATEX_PROJECT_PATH
         echo "Done!"
         exit;;
      l)
         for d in /latex/templates/* ; do
            if [ -d $d ]; then
               echo $(basename $d)
            fi
         done
         exit;;
      *)
         Help
         exit;;
   esac
done
Help