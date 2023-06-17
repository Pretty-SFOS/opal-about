#!/bin/bash
#
# This file is part of Opal and has been released into the public domain.
# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2021-2023 Mirian Margiani
#
# See https://github.com/Pretty-SFOS/opal/blob/main/opal-development/opal-release-module.md
# for documentation.
#
# @@@ keep this line: based on template v0.6.1
#
c__FOR_RELEASE_LIB__="0.6.3"

# Run this script from the module's root directory.
source ../opal/opal-development/opal-release-module.sh
parse_arguments "$@"

# Copy and edit this template file for new Opal modules.
# Module metadata will be read from doc/module.opal.
# Note: modules requiring extra build steps (Qt plugins) are not yet supported.

# which files and directories to translate
# Note: translations are built from the original sources, independent of the
# files marked for distribution in copy_files.
cTRANSLATE=(Opal)

# un-comment the following line to initially setup translations
# setup_translations

# Edit the copy_files() function if any additional copy steps are necessary.
# By default, the main Opal directory will be copied with all contents. It might
# be necessary to exclude certain files that are not meant for distribution.
# Use BUILD_ROOT, QML_BASE, and DOC_BASE (below BUILD_ROOT) to define target paths.
function copy_files() {
    build_qdoc to="$DOC_BASE"
    cp -r Opal "$QML_BASE/Opal" || return 1

    # We don't have to distribute the extra translations dummy file, as translations
    # are built separately and are merged if needed.
    rm "$QML_BASE/Opal/About/private/ExtraTranslations.qml"

    # Generate a default attribution file that can be directly used in projects.
    # No documentation will be generate for this file because it only exists in
    # the release bundle.
    printf "%s\n" \
        "//@ This file is part of ${cMETADATA[fullName]}." \
        "//@ https://github.com/Pretty-SFOS/${cMETADATA[fullName]}" \
        "//@ SPDX-FileCopyrightText: ${cMETADATA[attribution]}" \
        "//@ SPDX-License-Identifier: ${cMETADATA[mainLicenseSpdx]}" \
        "" \
        "import \"../../Opal/About\" as A" \
        "A.Attribution {" \
        "    name: \"${cMETADATA[fullNameStyled]} (v${cMETADATA[version]})\"" \
        "    entries: \"${cMETADATA[attribution]}\"" \
        "    licenses: A.License { spdxId: \"${cMETADATA[mainLicenseSpdx]}\"}" \
        "    sources: \"https://github.com/Pretty-SFOS/${cMETADATA[fullName]}\"" \
        "    homepage: \"https://github.com/Pretty-SFOS/opal\"" \
        "}" "" > "$QML_BASE/Opal/About/OpalAboutAttribution.qml"
}

# build the bundle
build_bundle
