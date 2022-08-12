% LaTeX class for the Hafro report series

% History
% 1.0  12 Jun 2014  Arni Magnusson created

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hafrorep}[2014/06/12 v1.0 Hafro report]

% ----------
% 1  Inherit
% ----------

% 1.1 Report
\LoadClass[twoside]{report}

% ----------------
% 2  Load packages
% ----------------

% 2.1 Character
\RequirePackage[icelandic]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{txfonts}

% 2.2 Page
\RequirePackage[a4paper,hmargin=2.5cm,vmargin={2.6cm,2.9cm},foot=0.4cm]
{geometry}

% 2.3 Header and footer
\RequirePackage{fancyhdr}

% 2.4 Paragraph
\RequirePackage{multicol}
\RequirePackage{indentfirst}

% 2.5 Table
\RequirePackage{tabularx}

% 2.6 Figure
\RequirePackage{graphicx}
\RequirePackage[absolute,overlay,quiet]{textpos}
\RequirePackage{tikz}

% 2.7 Color
\RequirePackage{xcolor}

% -----------
% 3  Settings
% -----------

% 3.1 Character
\renewcommand\normalsize{\fontsize{10.3pt}{11.5pt}\selectfont}

% 3.2 Header and footer
\pagestyle{fancy}
\newcommand\hafroLeft{}
\newcommand\hafroRight{}
\fancyhead[LO]{\sf\fontsize{10.3}{11.5}\selectfont\hafroLeft}
\fancyhead[RE]{\sf\fontsize{10.3}{11.5}\selectfont\hafroRight}
\fancyhead[RO,LE]{\sf\fontsize{10.3}{11.5}\selectfont\thepage}
\fancyfoot{}
\renewcommand\headrule{\color{blue}\vspace{1pt}\hrule height 2pt\vspace{-4ex}}
\renewcommand\footrule{\color{blue}\hrule height 0.8pt\vspace{1.2pt}
  \hrule height 2pt\vspace{-0.4ex}}

% 3.3 Paragraph
\setlength{\columnsep}{0.7cm}

% 3.4 Table
\definecolor{TableColor}{RGB}{248,248,248}
\renewcommand\arraystretch{1.13}

% 3.5 Figure
\definecolor{ShadowColor}{gray}{0.8}
\usetikzlibrary{shadows}

% -----------
% 4  Sections
% -----------

% 4.1 Section
\renewcommand\section[1]
{\addtocounter{section}{1}\setcounter{subsection}{0}
  \vspace{1ex}\noindent\textbf{\thesection. #1}\vspace{0.5ex}}

% 4.2 Subsection
\renewcommand\subsection[1]
{\addtocounter{subsection}{1}\setcounter{subsubsection}{0}
  \vspace{1ex}\noindent\textbf{\thesubsection. #1}\vspace{0.5ex}}

% 4.3 Subsubsection
\renewcommand\subsubsection[1]
{\addtocounter{subsubsection}{1}
  \vspace{1ex}\noindent\textbf{\thesubsubsection. #1}\vspace{0.5ex}}

% ---------------
% 5 Large objects
% ---------------

% 5.1 Top banner
% #1 bold, #2 italic
\newcommand\banner[3]{
  ~\\[-1.4ex]\noindent
  \begin{tikzpicture}
    \filldraw [fill=white,drop shadow={opacity=1,fill=ShadowColor,
      shadow xshift=0.12,shadow yshift=-0.14,shadow scale=1.005}]
    (0,0) rectangle (\textwidth-1.15,1.15);
    \node at (0.42,0.58) [right]
    {\sffamily{\Large\bfseries #1.\hspace{1.0ex}#2}
      \hspace{1.2ex}\itshape #3};
  \end{tikzpicture}\\[-2.7ex]}

% 5.2 Animal painting
% #1 filename, #2 width, #3 xypos
\newcommand\painting[3]{
  \begin{textblock*}{0cm}(#3)
    \includegraphics[width=#2]{figs/#1}
  \end{textblock*}}

% 5.3 Gray table
\newenvironment{graytable}{
  \vspace{1.2ex}
  \begin{sf}
    \noindent\scriptsize\frenchspacing
    \begingroup\setlength{\fboxsep}{0pt}\colorbox{TableColor}
  }{
    \endgroup
  \end{sf}}

% 5.4 Plain figure
% #1 file, #2 above, #3 top, #4 mid, #5 bottom, #6 below, #7 is, #8 en
\newcommand\figplain[8]{
  ~\vspace{-5ex}\\[#2]\par
  \noindent\hspace{-1.4ex}
  \begin{tikzpicture}
    \node [drop shadow={opacity=1,fill=ShadowColor,shadow xshift=0.12,
      shadow yshift=-0.09,shadow scale=0.97}]
    {\fcolorbox{gray}{white}{\hspace{-3pt}
        \includegraphics[width=0.98\linewidth]{figs/#1}\hspace{-0.98\linewidth}
        \sf\scriptsize\parbox[t]{0.95\linewidth}{~\vspace{1ex}\\[#3]
          #7\vspace{1ex}\\[#4]
          \i #8\vspace{-1.5ex}\\[#5]}\hspace{1ex}}};
  \end{tikzpicture}\vspace{-3ex}\\[#6]}

% 5.5 Numbered figure
% #1 num, #2 file, #3 above, #4 top, #5 mid, #6 bottom, #7 below, #8 is, #9 en
\newcommand\fignumber[9]{
  \figplain{#2}{#3}{#4}{#5}{#6}{#7}
  {Mynd\@. \thesection.#1. #8}{\i Fig. \thesection.#1. #9}}

% ---------------
% 6  Small macros
% ---------------

% 6.1 Character
\renewcommand\b{\bfseries}
\renewcommand\i{\itshape}
\newcommand\f[1]{\textsuperscript{#1)}}
\newcommand\super[1]{\textsuperscript{#1}}

% 6.2 Paragraph
\newcommand\pause{\linebreak\\[-5ex]}
\newcommand\newcolumn{\vfill\columnbreak\noindent}

% 6.3 Table
\newcommand\I[1]{\rule{0pt}{#1}}
\newcommand\mc[1]{\multicolumn{1}{c}{#1}}
\newcommand\mcI[1]{\multicolumn{1}{c|}{#1}}
\newcommand\mIc[1]{\multicolumn{1}{|c}{#1}}
\newcommand\mIcI[2]{\multicolumn{#1}{|c|}{#2}}
\newcommand\mIlI[2]{\multicolumn{#1}{|l|}{#2}}
\newcommand\tabsection{3.\the\value{section}}
