#!/bin/sh -x
#
# DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS HEADER.
#
# Copyright (c) 2010-2011 Oracle and/or its affiliates. All rights reserved.
#
# The contents of this file are subject to the terms of either the GNU
# General Public License Version 2 only ("GPL") or the Common Development
# and Distribution License("CDDL") (collectively, the "License").  You
# may not use this file except in compliance with the License.  You can
# obtain a copy of the License at
# https://glassfish.dev.java.net/public/CDDL+GPL_1_1.html
# or packager/legal/LICENSE.txt.  See the License for the specific
# language governing permissions and limitations under the License.
#
# When distributing the software, include this License Header Notice in each
# file and include the License file at packager/legal/LICENSE.txt.
#
# GPL Classpath Exception:
# Oracle designates this particular file as subject to the "Classpath"
# exception as provided by Oracle in the GPL Version 2 section of the License
# file that accompanied this code.
#
# Modifications:
# If applicable, add the following below the License Header, with the fields
# enclosed by brackets [] replaced by your own identifying information:
# "Portions Copyright [year] [name of copyright owner]"
#
# Contributor(s):
# If you wish your version of this file to be governed by only the CDDL or
# only the GPL Version 2, indicate your decision by adding "[Contributor]
# elects to include this software in this distribution under the [CDDL or GPL
# Version 2] license."  If you don't indicate a single choice of license, a
# recipient has the option to distribute your version of this file under
# either the CDDL, the GPL Version 2 or to extend the choice of license to
# its licensees as provided above.  However, if you add GPL Version 2 code
# and therefore, elected the GPL Version 2 license, then the option applies
# only if the new code is made subject to such option by the copyright
# holder.

echo Change the maven local repo path as per your environment
MVN_LOCAL_REPO=$HOME/.m2/repository

# Pick the current version. something like 1.0.13-SNAPSHOT
foo=`grep -m 1 "<version>" pom.xml | sed "s%<version>%%" | sed "s%</version>%%"`
VERSION=`echo $foo`
#CLASSPATH=$MVN_LOCAL_REPO/org/glassfish/hk2/hk2-deprecated/$VERSION/hk2-deprecated-$VERSION.jar:$MVN_LOCAL_REPO/org/glassfish/hk2/core/$VERSION/core-$VERSION.jar:$MVN_LOCAL_REPO/com/oracle/glassfish/hk2-dependency-verifier/$VERSION/hk2-dependency-verifier-$VERSION.jar:$MVN_LOCAL_REPO/org/glassfish/hk2/hk2-api/$VERSION/hk2-api-$VERSION.jar:$MVN_LOCAL_REPO/org/glassfish/hk2/hk2-core/$VERSION/hk2-core-$VERSION.jar:$MVN_LOCAL_REPO/org/glassfish/hk2/auto-depends/$VERSION/auto-depends-$VERSION.jar:$MVN_LOCAL_REPO/org/glassfish/hk2/osgi-adapter/$VERSION/osgi-adapter-$VERSION.jar:$MVN_LOCAL_REPO/org/apache/bcel/bcel/5.2/bcel-5.2.jar:$MVN_LOCAL_REPO/org/osgi/org.osgi.core/4.2.0/org.osgi.core-4.2.0.jar

CLASSPATH=$MVN_LOCAL_REPO/org/glassfish/hk2/core/2.1.28/core-2.1.28.jar:$MVN_LOCAL_REPO/org/glassfish/modularity-tools/modularity-tools.dependency-analyser/1.0.0-SNAPSHOT/modularity-tools.dependency-analyser-1.0.0-SNAPSHOT.jar:$MVN_LOCAL_REPO/org/glassfish/hk2/osgi-adapter/2.1.28/osgi-adapter-2.1.28.jar:$MVN_LOCAL_REPO/org/apache/bcel/bcel/5.2/bcel-5.2.jar:$MVN_LOCAL_REPO/org/osgi/org.osgi.core/4.2.0/org.osgi.core-4.2.0.jar:$MVN_LOCAL_REPO/org/glassfish/hk2/hk2-deprecated/2.1.28/hk2-deprecated-2.1.28.jar

java $JDEBUG -ea -DExcludedPatterns="javax." -cp $CLASSPATH -DdebugOutput=/tmp/closure.txt com.sun.enterprise.tools.verifier.hk2.PackageAnalyser $*

