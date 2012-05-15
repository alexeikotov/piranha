#    Copyright (C) 2011 University of Southern California,
#    Philip J. Uren, Andrew D. Smith
#
#    Authors: Philip J. Uren, Andrew D. Smith
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

all:
	@make -C src OPT=1

install:
	@make -C src OPT=1 install
	
test:
	@make -C src OPT=1 test
.PHONY: test

clean:
	@make -C src clean
.PHONY: clean

developmentDocs:
	@doxygen ./src/doxygen.config
.PHONY: developmentDocs 

distclean: clean
	@rm -rf ./bin
	@rm -rf ./developmentDocs
	@make -C src OPT=1 distclean
.PHONY: distclean


tarball: clean distclean
	tar --exclude=".*" -cvjf piranha-1.0a.tar.bz2 src/ Makefile README.TXT gpl.txt 