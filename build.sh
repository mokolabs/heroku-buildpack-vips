#!/bin/bash

# Set vips version
export VIPS_VERSION=8.1.1
export WEBP_VERSION=0.4.0
export ORC_VERSION=0.4.18
export FFTW_VERSION=3.3.4
export TIFF_VERSION=4.0.3
export GETTEXT_VERSION=0.19.1
export BUILD_PATH=/tmp
export OUT_PATH=/app/vendor/vips
export PKG_CONFIG_PATH=$OUT_PATH/lib/pkgconfig:$PKG_CONFIG_PATH
export PATH=$OUT_PATH/bin:$PATH

# Remove out path if already exists
rm -Rf $OUT_PATH

# Build path
cd $BUILD_PATH

###############
#     Orc     #
###############

# Download orc dependency
curl http://cgit.freedesktop.org/gstreamer/orc/snapshot/orc-$ORC_VERSION.tar.gz -o orc.tar.gz
# Unzip
tar -xvf orc.tar.gz
# Get into orc folder
cd orc-$ORC_VERSION
# Configure
./autogen.sh
# Configure build
./configure --prefix $OUT_PATH
# Make orc
make
# Install orc
make install

# Build path
cd $BUILD_PATH

###############
#     WebP    #
###############

# Download webp dependency
curl https://webp.googlecode.com/files/libwebp-$WEBP_VERSION.tar.gz -o libwebp.tar.gz
# Unzip
tar -xvf libwebp.tar.gz
# Get into webp folder
cd libwebp-$WEBP_VERSION
# Configure build
./configure --prefix $OUT_PATH
# Make libwebp
make
# Install webp
make install

# Build path
cd $BUILD_PATH

###############
#   LIBTIFF   #
###############

# # Download tiff dependency
# curl http://download.osgeo.org/libtiff/tiff-$TIFF_VERSION.tar.gz -o libtiff.tar.gz
# # Unzip
# tar -xvf libtiff.tar.gz
# # Get into libtiff folder
# cd tiff-$TIFF_VERSION
# # Configure build
# ./configure --prefix $OUT_PATH
# # Make libtiff
# make
# # Install libtiff
# make install
#
# # Build path
# cd $BUILD_PATH

###############
#    FFTW     #
###############

# Download fftw dependency
curl http://www.fftw.org/fftw-$FFTW_VERSION.tar.gz -o fftw.tar.gz
# Unzip
tar -xvf fftw.tar.gz
# Get into fftw folder
cd fftw-$FFTW_VERSION
# Configure build
./configure --enable-shared --prefix $OUT_PATH
# Make fftw
make
# Install fftw
make install
# Clean and compile/install single precision too
make clean
./configure --enable-shared --enable-float --prefix $OUT_PATH
make
make install

# Build path
cd $BUILD_PATH

###############
#    CPANM    #
###############

# Download cpanm
curl https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm -o cpanm
# Make it executable
chmod +x cpanm
# Use local lib
./cpanm --local-lib=~/perl5 local::lib && eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
# Install xml module (in /app/perl5)
./cpanm -v XML::Parser

# Build path
cd $BUILD_PATH

###############
#  INTLTOOL   #
###############

# Download intltool dependency
curl http://ftp.gnome.org/pub/GNOME/sources/intltool/0.40/intltool-0.40.6.tar.gz -o intltool.tar.gz
# Unzip
tar -xvf intltool.tar.gz
# Get into intltool folder
cd intltool-0.40.6
# Configure build
./configure --prefix $OUT_PATH
# Make intltool
make
# Install intltool
make install

# Build path
cd $BUILD_PATH

###############
#   GETTEXT   #
###############

# Download gettext dependency
curl http://ftp.gnu.org/pub/gnu/gettext/gettext-$GETTEXT_VERSION.tar.gz -o gettext.tar.gz
# Unzip
tar -xvf gettext.tar.gz
# Get into gettext folder
cd gettext-$GETTEXT_VERSION
# Configure build
./configure --prefix $OUT_PATH
# Make gettext
make
# Install gettext
make install

# Build path
cd $BUILD_PATH

###############
#    LIBFFI   #
###############

# Download libffi dependency
curl ftp://sourceware.org/pub/libffi/libffi-3.1.tar.gz -o libffi.tar.gz
# Unzip
tar -xvf libffi.tar.gz
# Get into libffi folder
cd libffi-3.1
# Configure build
./configure --prefix $OUT_PATH
# Make libffi
make
# Install libffi
make install

# Build path
cd $BUILD_PATH

###############
#     GLIB    #
###############

# Download glib dependency
curl http://ftp.gnome.org/pub/gnome/sources/glib/2.41/glib-2.41.1.tar.xz -o glib.tar.xz
# Unzip
tar -xvf glib.tar.xz
# Get into glib folder
cd glib-2.41.1
# Configure build
./configure --prefix $OUT_PATH
# Make glib
make
# Install glib
make install

# Build path
cd $BUILD_PATH

###############
#     GSF     #
###############

# Download libgsf dependency
curl -L http://ftp.gnome.org/pub/GNOME/sources/libgsf/1.14/libgsf-1.14.30.tar.xz -o libgsf.tar.xz
# Unzip
tar -xvf libgsf.tar.xz
# Get into libgsf folder
cd libgsf-1.14.30
# Configure build
./configure --prefix $OUT_PATH
# Make gsf
make
# Install gsf
make install

# Build path
cd $BUILD_PATH

###############
#   CFITSIO   #
###############

# Download CFITSIO dependency
curl -L ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/cfitsio3370.tar.gz -o cfitsio.tar.gz
# Unzip
tar -xvf cfitsio.tar.gz
# Get into CFITSIO folder
cd cfitsio
# Configure build
./configure --prefix $OUT_PATH
# Make cfitsio
make
# Install cfitsio
make install

# Build path
cd $BUILD_PATH

###############
# Imagemagick #
###############

# Download Imagemagick dependency
curl -L http://www.imagemagick.org/download/releases/ImageMagick-6.9.0-0.tar.xz -o ImageMagick.tar.xz
# Unzip
tar -xvf ImageMagick.tar.xz
# Get into Imagemagick folder
cd ImageMagick-6.9.0-0
# Configure build
./configure --prefix $OUT_PATH  --with-gcc-arch
# Make Imagemagick
make
# Install Imagemagick
make install

# Build path
cd $BUILD_PATH

###############
#     LCMS    #
###############

# Download lcms dependency
curl -L http://downloads.sourceforge.net/project/lcms/lcms/2.6/lcms2-2.6.tar.gz -o lcms.tar.gz
# Unzip
tar -xvf lcms.tar.gz
# Get into lcms folder
cd lcms2-2.6
# Configure build
./configure --prefix $OUT_PATH
# Make lcms
make
# Install lcms
make install

# Build path
cd $BUILD_PATH

###############
#     VIPS    #
###############

# Download vips runtime
curl http://www.vips.ecs.soton.ac.uk/supported/current/vips-$VIPS_VERSION.tar.gz -o vips.tar.gz
# Unzip
tar -xvf vips.tar.gz
# Get into vips folder
cd vips-$VIPS_VERSION
# Configure build and output everything in /tmp/vips
./configure --prefix $OUT_PATH
# Make
make
# install vips
make install


###############
#    Output   #
###############

# Get into output path
cd $OUT_PATH
# Clean useless files
rm -rf $OUT_PATH/share/{doc,gtk-doc}
# Create dist package
tar -cvzf output.tar.gz *

###############
#     FTP     #
###############

#curl -T output.tar.gz -u username:password ftp://yourftpsitehere/
