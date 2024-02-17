%----------------------------------------------------------------------------------------
% Plantilla LaTeX para Tesis o Tesina
% Autor: Esteban Hernandez Santiago
% Fecha de creación: 15/02/2024
% Descripción: 
%----------------------------------------------------------------------------------------
% DECLARACIÓN E INFORMACIÓN DE LA CLASE
%----------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tFIC3}[2024/02/08 tFIC3 Clase personalizada para Tesis]

%----------------------------------------------------------------------------------------
% CLASE BASE
%----------------------------------------------------------------------------------------
\LoadClass[12pt,letterpaper,openright,oneside]{report}

%----------------------------------------------------------------------------------------
% PAQUETES BÁSICOS
%----------------------------------------------------------------------------------------
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[spanish,mexico,es-lcroman]{babel}
\RequirePackage{svg}
\RequirePackage{array}
\RequirePackage{mfirstuc}

\RequirePackage[normalem]{ulem} % Importa ulem para subrayado

%----------------------------------------------------------------------------------------
% CONFIGURACIÓN DE FUENTES
%----------------------------------------------------------------------------------------
\RequirePackage[scaled=0.92]{helvet}
\renewcommand*\familydefault{\sfdefault}

%----------------------------------------------------------------------------------------
% GEOMETRÍA Y MÁRGENES
%----------------------------------------------------------------------------------------
\RequirePackage{geometry}
\geometry{letterpaper, left=3.5cm, right=3cm, top=3cm, bottom=3cm, footnotesep=1cm}

%----------------------------------------------------------------------------------------
% INTERLINEADO Y ESPACIADO
%----------------------------------------------------------------------------------------
\RequirePackage{setspace}
\doublespacing
\setlength{\parindent}{0cm}
\setlength{\parskip}{\baselineskip}
\setlength{\intextsep}{\baselineskip}

%----------------------------------------------------------------------------------------
% CONFIGURACIÓN DE TÍTULOS
%----------------------------------------------------------------------------------------
\RequirePackage[bf, tiny, explicit]{titlesec}
\RequirePackage{tocloft}

\titlespacing{\chapter}{0pt}{-50pt}{0pt}
\titleformat{\chapter}[hang]{\center\bfseries}{\thechapter. \MakeTextUppercase{#1}}{0pt}{}
\titleformat{name=\chapter,numberless}[hang]{\center\bfseries}{\MakeTextUppercase{#1}}{0pt}{}
\titlespacing*{\section}{0pt}{0em}{1em}
\titlespacing*{\subsection}{0pt}{0em}{1em}
\titlespacing*{\subsubsection}{0pt}{0em}{1em}
% \titlespacing*{\paragraph}{0pt}{0em}{1em}

\usepackage{titlesec}
\titleformat{\paragraph}
  [block]{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{#1}
\titlespacing*{\paragraph}
  {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

%----------------------------------------------------------------------------------------
% MEJORAS VISUALES Y FUNCIONALES
%----------------------------------------------------------------------------------------
\RequirePackage{mathtools}
\RequirePackage{csquotes}
\RequirePackage{textcase}
\RequirePackage[pdflang=es-MX, linktocpage=true, hidelinks]{hyperref}
\RequirePackage{float}
\RequirePackage[skip=10pt]{caption}
\RequirePackage{chngcntr}

\captionsetup[figure]{labelsep=period}
\captionsetup[table]{labelsep=period}
\captionsetup[table]{position=top}
\captionsetup[algorithm]{labelsep=period}
\captionsetup{belowskip=0pt}

\setlength{\abovedisplayskip}{\baselineskip}
\setlength{\belowdisplayskip}{\baselineskip}

%----------------------------------------------------------------------------------------
% BIBLIOGRAFÍA Y CITAS
%----------------------------------------------------------------------------------------
\RequirePackage[backend=biber,style=ieee,backref=true,defernumbers=true,hyperref=auto,backrefstyle=none]{biblatex}
% \DefineBibliographyStrings{spanish}{backrefpage = {Citado en página}, backrefpages = {Citado en páginas},}
\DeclareBibliographyCategory{cited}
\AtEveryCitekey{\addtocategory{cited}{\thefield{entrykey}}}

%----------------------------------------------------------------------------------------
% ALGORITMOS
%----------------------------------------------------------------------------------------
\RequirePackage[ruled]{algorithm}
\RequirePackage{algpseudocode}
\algrenewcommand\algorithmicrequire{\textbf{Input:}}
\algrenewcommand\algorithmicensure{\textbf{Output:}}

%----------------------------------------------------------------------------------------
% LISTAS Y ÍNDICES PERSONALIZADOS
%----------------------------------------------------------------------------------------
\newcommand{\listequationname}{Índice de Ecuaciones}
\newlistof{equations}{loe}{\listequationname}
\newcommand{\equations}[1]{%
  \addcontentsline{loe}{equations}{\protect\numberline{\theequation}#1}%
  \par
}

\makeatletter
\begingroup
  \let\newcounter\@gobble
  \let\setcounter\@gobbletwo
  \globaldefs\@ne
  \let\c@loadepth\@ne
  \newlistof{algorithms}{loa}{\listalgorithmname}
\endgroup
\let\l@algorithm\l@algorithms
\makeatother
\providecommand{\listalgorithmname}{Índice de Algoritmos}
%----------------------------------------------------------------------------------------
% ENCABEZADOS Y PIES DE PÁGINA
%----------------------------------------------------------------------------------------
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\rhead{\thepage}
\setlength{\headheight}{14.5pt}
\fancypagestyle{plain}{\rhead{}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

%----------------------------------------------------------------------------------------
% CONFIGURACIONES DE ENUMERACIÓN Y TRADUCCIONES
%----------------------------------------------------------------------------------------
\renewcommand{\thechapter}{\Roman{chapter}}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\theequation}{\arabic{equation}}
\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}
\floatname{algorithm}{Algoritmo}
\addto\captionsspanish{
  \renewcommand{\tablename}{Cuadro}
  \renewcommand{\contentsname}{CONTENIDO}
  \renewcommand{\listfigurename}{ÍNDICE DE FIGURAS}
  \renewcommand{\listtablename}{ÍNDICE DE CUADROS}
  \renewcommand{\listalgorithmname}{ÍNDICE DE ALGORITMOS}
  \renewcommand{\listequationname}{ÍNDICE DE ECUACIONES}
  % APENDICES
  \renewcommand{\listappendixfiguresname}{ÍNDICE DE APÉNDICE FIGURAS}
  \renewcommand{\listappendixtablesname}{ÍNDICE DE APÉNDICE CUADROS}
}

%----------------------------------------------------------------------------------------
% OTROS AJUSTES VISUALES
%----------------------------------------------------------------------------------------
\RequirePackage{xcolor}
\RequirePackage{eso-pic}
% \AddToShipoutPictureBG{%
%   \AtTextLowerLeft{%
%     \color{blue!20}
%     \rule{\textwidth}{\textheight}%
%   }%
% }

%----------------------------------------------------------------------------------------
% AJUSTES DE INDENTACIÓN Y FORMATEO PARA ÍNDICES Y LISTAS
%----------------------------------------------------------------------------------------
\newlength{\customindent}
\setlength{\customindent}{1.68cm}

\cftsetindents{chapter}{0pt}{\customindent}
\cftsetindents{section}{0pt}{\customindent}
\cftsetindents{subsection}{0pt}{\customindent}
\cftsetindents{subsubsection}{0pt}{\customindent}
\cftsetindents{paragraph}{0pt}{\customindent}
\cftsetindents{figure}{0pt}{\customindent}
\cftsetindents{table}{0pt}{\customindent}
\cftsetindents{algorithms}{0pt}{\customindent}
\cftsetindents{equations}{0pt}{\customindent}

% Ajustar el ancho de la caja para los números de página
% \cftsetpnumwidth{2.14cm}

% Ajustar el margen derecho para los títulos
\cftsetrmarg{2.14cm}

\renewcommand{\cftpnumalign}{c}
\renewcommand{\cftdot}{}
\renewcommand{\cftchapfont}{\bfseries\normalsize\MakeTextUppercase}
\renewcommand{\cftsecfont}{\normalsize}
\renewcommand{\cftsubsecfont}{\normalsize}
\renewcommand{\cftsubsubsecfont}{\normalsize}
\renewcommand{\cftparafont}{\normalsize}
\renewcommand{\cfttoctitlefont}{\hfil\bfseries\normalsize}
\renewcommand{\cftloftitlefont}{\hfil\bfseries\normalsize}
\renewcommand{\cftlottitlefont}{\hfil\bfseries\normalsize}
\renewcommand{\cftloatitlefont}{\hfil\bfseries\normalsize}
\renewcommand{\cftloetitlefont}{\hfil\bfseries\normalsize}
% APENDICES

%----------------------------------------------------------------------------------------
% CONTADORES
%----------------------------------------------------------------------------------------
\newcounter{experiment}
% Enumeración continua de figuras
\counterwithout{figure}{chapter}
% Enumeración continua de tablas
\counterwithout{table}{chapter}
% Enumeración continua de ecuaciones
\counterwithout{equation}{chapter}

%----------------------------------------------------------------------------------------
% COMANDOS PERSONALIZADOS
%----------------------------------------------------------------------------------------
% Comandos para atributos reutilizables
\newcommand{\tituloTesis}[1]{\newcommand{\elTitulo}{#1}}
\newcommand{\nombreEstudiante}[1]{\newcommand{\elEstudiante}{#1}}
\newcommand{\tipoDocumento}{tesis} % Definición inicial
\newcommand{\setTipoDocumento}[1]{\renewcommand{\tipoDocumento}{#1}} % Permite cambiar el valor
\newcommand{\nombrePrograma}[1]{\newcommand{\elPrograma}{#1}}
\newcommand{\anio}[1]{\newcommand{\elanioTesis}{#1}}

\newcommand{\fechaLiberacion}[3]{%
    \newcommand{\elDia}{#1}%
    \newcommand{\elMes}{#2}%
    \newcommand{\elAnio}{#3}%
    \newcommand{\laFechaLiberacion}{\elDia\ de \elMes\ del \elAnio}%
}

\newcommand{\directorTesis}[1]{\newcommand{\elDirectorTesis}{#1}}
\newcommand{\codirectorTesis}[1]{\newcommand{\elCodirectorTesis}{#1}}
\newcommand{\asesorUno}[1]{\newcommand{\elAsesorUno}{#1}}
\newcommand{\asesorDos}[1]{\newcommand{\elAsesorDos}{#1}}
\newcommand{\asesorTres}[1]{\newcommand{\elAsesorTres}{#1}}
\newcommand{\asesorCuatro}[1]{\newcommand{\elAsesorCuatro}{#1}}
\newcommand{\asesorCinco}[1]{\newcommand{\elAsesorCinco}{#1}}

\newcommand{\grado}[1]{\newcommand{\elgrado}{#1}}

% \RequirePackage{etoolbox}
% Definir nuevas variables
\newcommand{\tipoGrado}{}
\newcommand{\tituloGrado}{}

% Comando para la Hoja de Aprobación
\newcommand{\hojaAprobacion}{
    \input{Formatos/HojaAprobacion}
    \clearpage
}

% Comandos para la portada y contraportada
\newcommand{\portada}{
    \input{Formatos/Portada}
    \clearpage
}

\newcommand{\contraportada}{
    \input{Formatos/Contraportada}
    \clearpage
}

% Comando para Dedicatoria
\newcommand{\dedicatoria}{
  \phantomsection
  \chapter*{DEDICATORIA} % (fold)
  \label{cha:dedicatoria}
  \input{Preambulo/Dedicatoria}
  \clearpage
}

% Comando para agradecimientos
\newcommand{\agradecimientos}{
  \phantomsection
  \chapter*{AGRADECIMIENTOS} % (fold)
  \label{cha:agradecimientos}
  \input{Preambulo/Agradecimientos}
  \clearpage
}

\newcommand{\contenido}{
    \begingroup % Inicia un grupo para contener los cambios
        \setlength{\cftbeforetoctitleskip}{0em} % Reduce el espacio antes del título
        \setlength{\cftaftertoctitleskip}{24pt} %Espacio entre el Titulo y las lineas de diiseño
        \singlespacing % Aplica interlineado sencillo
        \setlength{\cftbeforechapskip}{3pt}
        % \renewcommand*{\addvspace}[0]{}
        \addtocontents{toc}{\protect\hrulefill\par \hfill Página \protect\par \vspace{-8.6pt} \protect\hrulefill\par}
        \tableofcontents
        \clearpage
    \endgroup % Termina el grupo, revirtiendo a la configuración anterior
}

\newcommand{\indiceFiguras}{
    \begingroup % Inicia un grupo para contener los cambios
    \setlength{\cftbeforeloftitleskip}{0em} % Reduce el espacio antes del título en la Lista de Figuras
    \setlength{\cftafterloftitleskip}{24pt}
    \singlespacing % Aplica interlineado sencillo
    \addtocontents{lof}{\protect\addvspace{0pt}}
    \renewcommand*{\addvspace}[1]{}
    \phantomsection
    % Aquí se usa el paquete tocloft para ajustar temporalmente la indentación de las entradas no numeradas
    \addtocontents{toc}{\protect\setlength{\cftchapindent}{\customindent}} % Ajusta la sangría para capítulos
    \addcontentsline{toc}{chapter}{\listfigurename}
    \addtocontents{lof}{\protect\hrulefill\par Figura \hfill Título \hfill Página \protect\par \vspace{-8.6pt} \protect\hrulefill\par}
    \listoffigures
    \clearpage
    \endgroup
}

\newcommand{\indiceCuadros}{
    \begingroup % Inicia un grupo para contener los cambios
        \setlength{\cftbeforelottitleskip}{0em} % Reduce el espacio antes del título en la Lista de Tablas
        \setlength{\cftafterlottitleskip}{24pt}
        \singlespacing % Aplica interlineado sencillo
        \renewcommand*{\addvspace}[1]{}
        \phantomsection
        \addcontentsline{toc}{chapter}{\listtablename}
        \addtocontents{lot}{\protect\hrulefill\par Cuadro \hfill Título \hfill Página \protect\par \vspace{-8.6pt} \protect\hrulefill\par}
        \listoftables
        \clearpage
    \endgroup
}

\newcommand{\indiceEcuaciones}{
    \begingroup
        \setlength{\cftbeforeloetitleskip}{0em}
        \setlength{\cftafterloetitleskip}{24pt}
        \singlespacing
        \phantomsection
        \addcontentsline{toc}{chapter}{\listequationname}
        \addtocontents{loe}{\protect\hrulefill\par Ecuación \hfill Título \hfill Página \protect\par \vspace{-8.6pt} \protect\hrulefill\par}
        \listofequations
        \clearpage
    \endgroup
}


\newcommand{\indiceAlgoritmos}{
    \begingroup
        \setlength{\cftbeforeloatitleskip}{0em}
        \setlength{\cftafterloatitleskip}{24pt}
        \singlespacing
        \phantomsection
        \addcontentsline{toc}{chapter}{\listalgorithmname}
        \addtocontents{loa}{\protect\hrulefill\par Algoritmo \hfill Título \hfill Página \protect\par \vspace{-8.6pt} \protect\hrulefill\par}
        \listofalgorithms
        \clearpage
    \endgroup
}

% Comando para Resumen
\newcommand{\resumen}{
  \phantomsection
  \chapter*{RESUMEN} % (fold)
  \label{cha:resumen}
  \addcontentsline{toc}{chapter}{RESUMEN}
  \input{Preambulo/Resumen}
  \clearpage
}

% Comando para Summary
\newcommand{\summary}{
  \phantomsection
  \chapter*{SUMMARY} % (fold)
  \label{cha:summary}
  \addcontentsline{toc}{chapter}{SUMMARY}
  \input{Preambulo/Summary}
  \clearpage
  % Restablece la sangría de las entradas de capítulos en la ToC a su valor original si es necesario
  \addtocontents{toc}{\protect\setlength{\cftchapindent}{0em}}
}

%----------------------------------------------------------------------------------------
% COMANDOS PARA CAPITULOS
%----------------------------------------------------------------------------------------

\newcommand{\introduccion}{
  \newpage
  \chapter{INTRODUCCIÓN}
  \input{Capitulos/1-Introduccion}
}

\newcommand{\revisionLiteratura}{
  \newpage
  \chapter{REVISIÓN DE LITERATURA}
  \input{Capitulos/2-Revision-de-Literatura}
}

\newcommand{\materialesMetodos}{
  \newpage
  \chapter{MATERIALES Y MÉTODOS}
  \input{Capitulos/3-Materiales-y-Metodos}
}

\newcommand{\resultadosDiscusion}{
  \newpage
  \chapter{RESULTADOS Y DISCUSIÓN}
  \input{Capitulos/4-Resultados-y-Discusion}
}

\newcommand{\conclusiones}{
  \newpage
  \chapter{CONCLUSIONES}
  \input{Capitulos/5-Conclusiones}
}

\newcommand{\bibliografia}{
  \newpage
  \chapter{BIBLIOGRAFÍA}
  \input{Capitulos/6-Bibliografia}
}

%----------------------------------------------------------------------------------------
% COMANDOS PARA APÉNDICES
%----------------------------------------------------------------------------------------

% Comando para iniciar la sección de apéndices
\newcommand{\iniciarApendices}{
  \appendix
  % \chapter*{APÉNDICES}
  % \addcontentsline{toc}{chapter}{APÉNDICES}
  \renewcommand{\thechapter}{\Alph{chapter}}
  \renewcommand{\thefigure}{\Alph{chapter}.\arabic{figure}}
  \renewcommand{\thetable}{\Alph{chapter}.\arabic{table}}
}

% Comando para añadir un apéndice específico
\newcommand{\apendice}[1]{
  \chapter{#1}
  \setcounter{figure}{0} % Reinicia el contador de figuras para el apéndice actual
  \setcounter{table}{0} % Reinicia el contador de cuadros(tablas) para el apéndice actual
}

\newcommand{\listappendixfiguresname}{Índice de Apéndice de Figuras}
\newlistof{appendixfigures}{loaf}{\listappendixfiguresname}

\makeatletter
\newenvironment{appendixfigure}[1][htbp]
  {% Preparación del entorno
   \def\@captype{figure}
   \let\oldcaption\caption
   \renewcommand{\caption}[2][]{
     \oldcaption[##1]{##2}
     \addcontentsline{loaf}{figure}{\protect\numberline{\thefigure}##2}
   }
   \begin{figure}[#1]}
  {% Cierre del entorno
   \end{figure}}
\makeatother


\renewcommand{\cftloaftitlefont}{\hfil\bfseries\normalsize}
\newcommand{\indiceApendiceFiguras}{
    \begingroup
        \setlength{\cftbeforeloaftitleskip}{0em}
        \setlength{\cftafterloaftitleskip}{24pt}
        \singlespacing
        \phantomsection
        \addcontentsline{toc}{chapter}{\listappendixfiguresname}
        \addtocontents{loaf}{\protect\hrulefill\par Figura \hfill Título \hfill Página \protect\par \vspace{-8.6pt} \protect\hrulefill\par}
        \listofappendixfigures
        \clearpage
    \endgroup
}

% Apendice lista de Cuadros
% Definir el nombre para la lista de cuadros de apéndices
\newcommand{\listappendixtablesname}{Índice de Apéndice de Cuadros}
\newlistof{appendixtables}{loat}{\listappendixtablesname}

% Entorno personalizado para cuadros en apéndices
\makeatletter
\newenvironment{appendixtable}[1][htbp]
  {% Preparación del entorno
   \def\@captype{table}
   \let\oldcaption\caption
   \renewcommand{\caption}[2][]{
     \oldcaption[##1]{##2}
     \addcontentsline{loat}{table}{\protect\numberline{\thetable}##2}
   }
   \begin{table}[#1]}
  {% Cierre del entorno
   \end{table}}
\makeatother

% Ajustar el estilo del título del índice de cuadros de apéndices
\renewcommand{\cftloattitlefont}{\hfil\bfseries\normalsize}

% Comando para generar el índice de cuadros de apéndices
\newcommand{\indiceApendiceCuadros}{
    \begingroup
    \setlength{\cftbeforeloattitleskip}{0em}
    \setlength{\cftafterloattitleskip}{24pt}
    \singlespacing
    \phantomsection
    \addcontentsline{toc}{chapter}{\listappendixtablesname}
    \addtocontents{loat}{\protect\hrulefill\par Cuadro \hfill Título \hfill Página \protect\par \vspace{-8.6pt} \protect\hrulefill\par}
    \listofappendixtables
    \clearpage
    \endgroup
}


%----------------------------------------------------------------------------------------
% FIN DE LA CLASE
%----------------------------------------------------------------------------------------
