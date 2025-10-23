# Configuration area

# Full path to Python. For Windows this is typically
# C:\Python27\python.exe; if it is in your path you don't need to change it.
PYTHON=python3

# Full path to main.py in the optimizer. Depends on where it was unpacked.
OPTIMIZER=/opt/pyoptimizer/main.py

# Which preprocessor to use. Use 'gcpp' for GNU cpp (typical on Linux/OSX);
# use 'mcpp' for mcpp.
PREPROC_KIND=gcpp

# Full path to the preprocessor. Depends on where you have downloaded it.
# If the preprocessor is GNU cpp and it is in your path, leave it as cpp.
PREPROC_PATH=cpp

# Full path to the zip program (zip.exe for Windows). Depends on where you
# have downloaded it. If it is in your path you don't need to change it.
ZIP=zip

# Name of the zipped file to generate for SL
SLZIP=AVsitterPlus.zip

# Name of the zipped file to generate for OpenSim
OSZIP=AVsitterPlus-oss.zip

# End of configuration area


# Version being compiled (LSL string)
VERSION="2.3.1"


# Note some of these scripts don't strictly need to be optimized for memory.

OPTIMIZED=AVP_sitA.lslo\
 AVP_sitB.lslo\
 AVP_adjuster.lslo\
 AVP_helperscript.lslo\
 AVP_root-security.lslo\
 AVP_root.lslo\
 AVP_select.lslo\
 Plugins/AVP_camera/AVP_camera.lslo\
 Plugins/AVP_control/Xcite-Sensations/AVP_Xcite.lslo\
 Plugins/AVP_control/AVP_root-RLV-extra.lslo\
 Plugins/AVP_control/AVP_root-RLV.lslo\
 Plugins/AVP_control/AVP_root-control.lslo\
 Plugins/AVP_control/LockGuard/AVP_LockGuard.lslo\
 Plugins/AVP_control/LockGuard/AVP_LockGuard-object.lslo\
 Plugins/AVP_control/LockMeister/AVP_LockMeister.lslo\
 Plugins/AVP_faces/AVP_faces.lslo\
 Plugins/AVP_favs/AVP_favs.lslo\
 Plugins/AVP_prop/AVP_menu.lslo\
 Plugins/AVP_prop/AVP_prop.lslo\
 Plugins/AVP_prop/AVP_object.lslo\
 Plugins/AVP_sequence/AVP_sequence.lslo\
 Utilities/pos-generator.lslo\
 Utilities/pos-shifter.lslo\
 Utilities/Anim-perm-checker.lslo\
 Utilities/MLP-converter.lslo\
 Utilities/PMAC-Converter.lslo\
 Utilities/Missing-anim-finder.lslo\
 Utilities/Updater/update-receiver.lslo\
 Utilities/Updater/update-sender.lslo

UNOPTIMIZED=Utilities/Noob-detector.lsl

OPENSIM=AVP_sitA.oss\
 AVP_sitB.oss\
 AVP_adjuster.oss\
 AVP_helperscript.oss\
 AVP_root.oss\
 AVP_root-security.oss\
 AVP_select.oss\
 Plugins/AVP_camera/AVP_camera.oss\
 Plugins/AVP_faces/AVP_faces.oss\
 Plugins/AVP_prop/AVP_menu.oss\
 Plugins/AVP_prop/AVP_object.oss\
 Plugins/AVP_prop/AVP_prop.oss\
 Plugins/AVP_sequence/AVP_sequence.oss\
 Utilities/Anim-perm-checker.oss\
 Utilities/pos-generator.oss\
 Utilities/pos-shifter.oss\
 Utilities/Missing-anim-finder.oss\
 Utilities/MLP-converter.oss\
 Utilities/PMAC-Converter.oss\
 Utilities/Noob-detector.oss

all: $(SLZIP) $(OSZIP)

clean:
	$(PYTHON) build-aux.py rm $(SLZIP) $(OSZIP) $(OPTIMIZED) $(OPENSIM)

optimized: $(OPTIMIZED)

opensim: $(OPENSIM)

$(SLZIP): $(OPTIMIZED) $(UNOPTIMIZED)
	$(PYTHON) build-aux.py rm $@
	$(ZIP) $@ $(OPTIMIZED) $(UNOPTIMIZED)

%.lslo %.lslt: %.lsl
	$(PYTHON) $(OPTIMIZER) -H -O addstrings,shrinknames,-extendedglobalexpr -p $(PREPROC_KIND) --precmd=$(PREPROC_PATH) $(OFLAGS) $< -o $@

$(OSZIP): $(OPENSIM)
	$(PYTHON) build-aux.py rm $@
	$(ZIP) $@ $(OPENSIM)

%.oss: %.lsl
	$(PYTHON) build-aux.py oss-process $< > $@

# Bash only, probably GNU make only
setvars:
	for name in $(addprefix ',$(addsuffix ',$(OPTIMIZED:.lslo=.lsl))) $(addprefix ',$(addsuffix ',$(UNOPTIMIZED))); do $(PYTHON) build-aux.py setvars "$$name" version='$(VERSION)' ; done

release: setvars all

.PHONY : all clean optimized opensim setvars release
