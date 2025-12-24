# This file is part of Opal and has been released into the public domain.
# SPDX-License-Identifier: CC0-1.0
# SPDX-FileCopyrightText: 2021-2024 Mirian Margiani
# SPDX-FileCopyrightText: 2025 Peter G. (nephros)
#
# See https://github.com/Pretty-SFOS/opal for more information.

%define modulename Opal.About

Name:       opal-about
Summary:    “About” page for Sailfish apps
Version:    3.0.1
Release:    0
Group:      Development/Libraries
License:    CC-BY-SA-4.0 and CC0-1.0 and GFDL-1.3-or-later and GPL-3.0-or-later
#BuildArch:  noarch
URL:        https://github.com/Pretty-SFOS/opal
Source0:    %{url}/releases/download/v%{version}/%{name}-%{version}.tar.gz

BuildRequires:  qt5-qmake
BuildRequires:  qt5-qttools-linguist
BuildRequires:  pkgconfig(Qt5Core)

%description
A shiny and flexible “About” page supporting license info, contributors,
changelogs, donations, etc. in your Sailfish app.


%package translation-source
Summary:    Documentation for %{modulename}
Group:      Development/Libraries

%description translation-source
%{summary}.


#%%package doc
#Summary:    Documentation for %{modulename}
#Group:      Development/Libraries
#
#%%description doc
#%%{summary}.

%prep
%setup -q -n %{name}-%{version}

%build
%qmake5

%make_build

%install
%qmake5_install

%files
%dir %{_libdir}/qt5/qml/Opal/About
%{_libdir}/qt5/qml/Opal/About/*
%{_datadir}/translations/%{name}-*.qm

%files translation-source
%{_datadir}/translations/source/%{name}.ts

#%%files doc
#%%{_docdir}/%%{name}
