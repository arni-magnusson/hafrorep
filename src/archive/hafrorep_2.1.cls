% LaTeX class for the Hafro report series

% History
% 2.1  13 Sep 2014  Arni Magnusson increased top margin, frenchspace captions
% 2.0  12 Sep 2014  Arni Magnusson converted to 1-column layout
% 1.1  12 Sep 2014  Arni Magnusson added package 'ulem' (suggested by Kristjan)
% 1.0  12 Jun 2014  Arni Magnusson created

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hafrorep}[2014/09/13 v2.1 Hafro report]

% ----------
% 1  Inherit
% ----------

% 1.1 Report
\LoadClass[11pt,twoside]{report}

% ----------------
% 2  Load packages
% ----------------

% 2.1 Character
\RequirePackage[icelandic]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[normalem]{ulem}

% 2.2 Page
\RequirePackage
[a4paper,hmargin=2.5cm,vmargin={2.6cm,2.2cm},headsep=1.0cm,foot=0.5cm]{geometry}

% 2.3 Header and footer
\RequirePackage{color}
\RequirePackage{fancyhdr}

% 2.4 Section
\RequirePackage{titlesec}

% 2.5 Table
\RequirePackage{array}

% 2.6 Figure
\RequirePackage{graphicx}
\RequirePackage[absolute,overlay,quiet]{textpos}

% 2.7 Caption
\RequirePackage{caption}
\RequirePackage[rightcaption]{sidecap}

% -----------
% 3  Settings
% -----------

% 3.1 Species
\newcommand\speciesIS{}
\newcommand\speciesEN{}
\newcommand\speciesLA{}

% 3.2 Header and footer
\pagestyle{fancy}
\newcommand\hafroLeft{}
\newcommand\hafroRight{}
\fancyhead[LO]{\small\hafroLeft}
\fancyhead[RE]{\small\hafroRight}
\fancyhead[RO,LE]{\small\thepage}
\fancyfoot{}
\renewcommand\headrule{\color{blue}\vspace{1pt}\hrule height 2pt\vspace{-4ex}}
\renewcommand\footrule{\color{blue}\hrule height 0.8pt\vspace{1.2pt}
  \hrule height 2pt\vspace{-0.4ex}}

% 3.3 Section
\setcounter{secnumdepth}{3}
\titleformat\section{\bfseries}{\thesection}{1.5ex}{\I{2ex}}
\titleformat\subsection{\bfseries}{\thesubsection}{1.5ex}{\I{2ex}}
\titleformat\subsubsection{\bfseries}{\thesubsubsection}{1.5ex}{\I{2ex}}

% 3.4 Figure
\newcommand\figwidth{0.55\textwidth}

% 3.5 Caption
\renewcommand\sidecaptionsep{4ex}
\renewcommand\thefigure{\thesection.\arabic{figure}}
\renewcommand\thetable{\thesection.\arabic{table}}
\DeclareCaptionFormat{mapcap}{\frenchspacing#3\par\vspace{2ex}}
\DeclareCaptionFormat{figcap}{\frenchspacing#3\par\vspace{6ex}}
\DeclareCaptionFormat{tabcap}{\frenchspacing#3\par\vspace{-1.5ex}}
\captionsetup{font=footnotesize,format=figcap}

% ----------------
% 4  Large objects
% ----------------

% 4.1 Banner
% #1 prefix, #2 icelandic, #3 foreign
\newcommand\banner[3]
{\I{0pt}\vspace{8ex}\par\noindent{\b\huge#1~~#2~~\small\i #3}\vspace{3ex}}

% 4.2 Animal painting
% #1 file, #2 width, #3 xypos
\newcommand\painting[3]{
  \begin{textblock*}{0cm}(#3)
    \includegraphics[width=#2]{figs/#1}
  \end{textblock*}}

% 4.3 Figure showing a map
% #1 file, #2 position, #3 icelandic, #4 english
\newcommand\figmap[4]{
  \begin{SCfigure}[1][#2]
    \captionsetup{format=mapcap}
    \caption*{{\b\speciesIS}. #3\\[1ex]
      \i{\b\speciesEN}. #4}
    \includegraphics[width=\figwidth]{figs/#1}
  \end{SCfigure}}

% 4.4 Numbered figure
% #1 file, #2 label, #3 position, #4 icelandic, #5 english
\newcommand\fignum[5]{
  \begin{SCfigure}[1][#3]
    \caption{Mynd \thefigure. {\b\speciesIS}. #4\\[1ex]
      \i Figure \thefigure. {\b\speciesEN}. #5}
    \includegraphics[width=\figwidth]{figs/#1}
    \label{#2}
  \end{SCfigure}}

% ---------------
% 5  Small macros
% ---------------

% 5.1 Character
\renewcommand\b{\bfseries}
\renewcommand\i{\slshape}
\renewcommand\u{\uline}
\newcommand\f[1]{\textsuperscript{#1)}}
\newcommand\super[1]{\textsuperscript{#1}}

% 5.2 Table
\newcommand\I[1]{\rule{0pt}{#1}}
\newcommand\m{\multicolumn}
\newcommand\mc[1]{\multicolumn{1}{c}{#1}}
\newcommand\mci[1]{\multicolumn{1}{c}{\i #1}}
\newcommand\mcI[1]{\multicolumn{1}{c|}{#1}}
\newcommand\mciI[1]{\multicolumn{1}{c|}{\i #1}}
\newcommand\ml[1]{\multicolumn{1}{l}{#1}}
\newcommand\mli[1]{\multicolumn{1}{l}{\i #1}}
\newcommand\mlI[1]{\multicolumn{1}{l|}{#1}}
\newcommand\mliI[1]{\multicolumn{1}{l|}{\i #1}}
\newcommand\tabsection{3.\the\value{section}}
