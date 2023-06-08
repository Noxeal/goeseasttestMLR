#==============================================================================
# Fichier .profile de la chaîne ArchiPEL /archipel3/goeseasttestMLR 
#==============================================================================

#==============================================================================
# variable SOFT 
# CONFIG_SOFT créé pour leosafo le 5/9/2016.
#==============================================================================
SOFT=/soft
export SOFT

#==== umask====================================================================
umask 0022

#==============================================================================
# variables d'environnement generales ArchiPEL
#==============================================================================

ARCHIPEL_LEVEL=3
export ARCHIPEL_LEVEL
# Les développeurs doivent faire attention dans leur INSTALL/CONFIG.XXX :
# Il vaut mieux laisser le niveau 2 dans certaines chaînes, car certains scripts applicatifs recherchent ce niveau.
# Modification du 19/2/2018 : 2 => 3

ARCHIPEL_ID=goeseasttestMLR
export ARCHIPEL_ID

ARCHIPEL_TEMPLATE=STD
export ARCHIPEL_TEMPLATE

ARCHIPEL_ROOT=/archipel3/goeseasttestMLR
export ARCHIPEL_ROOT

ARCHIPEL_SOFT=/soft/cms/ArchiPEL
export ARCHIPEL_SOFT

ARCHIPEL_HHMNSS=ON
export ARCHIPEL_HHMNSS

PATH=/soft/python/bin/:/home/archipel3/dev/bin:/home/archipel3/dev/bin/to_geojson:/home/archipel3/dev/bin/eclairs:/usr/local/slurm/bin:/soft/pbmplus/bin:/soft/gdal/bin:/soft/cms/ArchiPEL/bin:/soft/cms/ArchiPEL/libsh:/soft/jdk/jre/bin:/soft/cms/cms/bin:/soft/netcdf/bin:/soft/imagemagick/bin:/soft/cms/cms/include:/soft/cms/cms/libsh:/soft/cms/cms/lib:/soft/cms/dirpf/bin:/soft/cms/dirpf/libsh:/soft/cms/ArchiPEL_goes/bin:/soft/cms/ArchiPEL_goes/bin/eclairs:/soft/cms/ArchiPEL_goes/libsh:/soft/cms/prod/bin://soft/cms/ArchiPEL_MSG/bin:/soft/cms/ArchiPEL_mtsatxrit/bin:/soft/libgeotiff/bin:/soft/cms/pbmplus/bin:/usr/kerberos/bin:/bin:/usr/sbin:/usr/local/bin:/usr/bin:/usr/jre/bin:C:/Users/Marjorie/Desktop/Cours/Alternances/Retrace/soft
export PATH

MANPATH=/soft/aapp/AAPP/man:/soft/cms/prod/man:/soft/cms/mdd/man:/soft/cms/qualsst/man:/soft/cms/ArchiPEL_iasi/man:/soft/cms/ArchiPEL_metop/man:/soft/cms/ArchiPEL_goes/man:/soft/cms/osat/man:/soft/cms/ArchiPEL_npp/man:/soft/cms/ArchiPEL_MSG/man:/soft/cms/ArchiPEL/man:/soft/cms/pbmplus/man:/soft/cms/medspi/man:/soft/cms/ocea/man:/soft/cms/otr/man:/soft/cms/safoa/man:/soft/cms/ArchiPEL_fy/man:/soft/cms/ArchiPEL_noaa/man:/soft/cms/log/man:/soft/cms/ArchiPEL_xsat/man:/soft/cms/puma2015/man:/soft/cms/ArchiPEL_dmsp/man:/soft/cms/cms/man:/soft/cms/safox/man:/soft/cms/ArchiPEL_mtsatxrit/man:/soft/imagemagick/share/man:/soft/jdk/man:/soft/libgeotiff/share/man:/soft/netcdf/share/man:/soft/proj/share/man:/soft/python/share/man:/soft/sqlite/share/man:/soft/tiff/share/man:/soft/zlib/share/man:/usr/man:/usr/local/slurm/man
export MANPATH

LD_LIBRARY_PATH=/soft/python/lib:/soft/proj/lib:/soft/gdal/lib:/soft/hdf5/lib:/soft/netcdf/lib64:/soft/geos/lib64:/soft/zlib/lib:/soft/gdal/lib/java:/soft/eccodes/lib:/soft/tiff/lib:/soft/tiffmf/lib:/soft/libgeotiff/lib:/soft/cms/ArchiPEL/lib:/soft/cms/ArchiPEL_MSG/lib:/soft/cms/cms/lib:/soft/cms/pbmplus/lib:/usr/lib:/usr/local/lib:/usr/local/lib64
export LD_LIBRARY_PATH

PERL5LIB=/soft/cms/ArchiPEL/libperl
export PERL5LIB

# Nécesssaire avec le système de fichier partagé Lustre :
export HDF5_USE_FILE_LOCKING=FALSE

CLASSPATH=/home/archipel3/dev/java:/soft/netcdf-java/netcdfAll-4.3.jar:/soft/cms/cms/java:/soft/cms/cms/java/*:/soft/gdal/java/*:/soft/cms/ArchiPEL_goes/java:/soft/cms/ArchiPEL_goes/java/*:/soft/cms/ArchiPEL_MSG/java/*:/soft/nujan/*:/soft/cms/ArchiPEL_MSG/java:/soft/cms/ArchiPEL/java:/soft/geotools/*
export CLASSPATH

# ------------------------------------------------------------------------------
# configuration PYTHONPATH 
# ------------------------------------------------------------------------------
PYTHONPATH=/home/archipel3/dev/bin:/soft/python/lib/python3.8/site-packages:/soft/cms/ArchiPEL_goes/bin:/soft/cms/ArchiPEL_goes/bin/eclairs:/soft/cms/cms/bin
export PYTHONPATH 


#------------------------------------------------------------------------------
# interface du service app
#------------------------------------------------------------------------------
ARCHIPEL_INT_APP_INPUT=A_app_input
export ARCHIPEL_INT_APP_INPUT

#------------------------------------------------------------------------------
# interface du service trs 
#------------------------------------------------------------------------------
ARCHIPEL_INT_TRS_INPUT=A_trs_input
export ARCHIPEL_INT_TRS_INPUT

ARCHIPEL_CALL_TRS=${ARCHIPEL_INT_TRS_INPUT}
export ARCHIPEL_CALL_TRS



# ------------------------------------------------------------------------------
# Interface des fonctions standard 
# navigation rajoutée pour npp le 20/7/2016.
# Avec une modification du 12/4/2019 : 
# comme nous avons enlevé les CONFIG.OPE, lorsqu'ils sont identiques aux CONFIG.STD,
# nous ne pouvons donc figer le nom des PROFILE_xxx à lire dans les .profile.
# Il faut que le .profile lise la variable d'environnement à chaud.
# 2/12/2021 : la lecture des PROFILE est étendue à l'ensemble des items des fonctions et des applications.
# ------------------------------------------------------------------------------
environnement=""
if [ -f ${ARCHIPEL_ROOT}/ENV ] ; then
	environnement="DEV"
	# Comment enlever les caractères d'espace ou de retour à la ligne. Je n'ai pas réussi. 12/4/2019.
fi

for itemfct in adm log rpt navigation ; do
	if [ "${environnement}" = "" ] ; then
		profile=${ARCHIPEL_ROOT}/fct/${itemfct}/PROFILE
		if [ -f ${profile} ]; then
			. ${profile}
		fi
	else
		profile=${ARCHIPEL_ROOT}/fct/${itemfct}/PROFILE_${environnement}
		if [ -f ${profile} ]; then
			. ${profile}
		else
			profile=${ARCHIPEL_ROOT}/fct/${itemfct}/PROFILE
			if [ -f ${profile} ]; then
				. ${profile}
			fi
		fi
	fi
done

# Il est nuisible de le faire sur tous les items, car les PATHs sont changés dans certains items.
# for itemapp in imgPREVI imgPREVIcc imgDATATION imgTIFFMF quicklooks imgTV imgW3 imgMEDIA imgINTERNE ncABIcorr ncABImultican imgSST ingestSegGoesr Xrit2Netcdf imgMFI VraieCouleur modeles eclairs eclairs4safnwc precip2 precip3 eclairsConcat imgIWC animations imgRrqpeAerosols ; do
#	if [ "${environnement}" = "" ] ; then
#		profile=${ARCHIPEL_ROOT}/app/${itemapp}/PROFILE
#		if [ -f ${profile} ]; then
#			. ${profile}
#		fi
#	else
#		profile=${ARCHIPEL_ROOT}/app/${itemapp}/PROFILE_${environnement}
#		if [ -f ${profile} ]; then
#			. ${profile}
#		else
#			profile=${ARCHIPEL_ROOT}/app/${itemapp}/PROFILE
#			if [ -f ${profile} ]; then
#				. ${profile}
#			fi
#		fi
#	fi
# done


#==============================================================================
# Forcage de la locale a C (US Style)
# prend le pas sur :
# LC_COLLATE 
# LC_CTYPE
# LC_MESSAGES
# LC_MONETARY
# LC_NUMERIC
# LC_TIME
#==============================================================================
LC_ALL=C
export LC_ALL

# Rajouté le 12/07/2019.
export LANG=fr_FR.UTF-8
export LC_ALL=fr_FR.UTF-8

#==============================================================================
# Primary prompt string
#==============================================================================
PS1="ArchiPEL ${ARCHIPEL_ID} (`uname -n`)$ "

#==============================================================================
# (C) METEO-FRANCE 
#==============================================================================
