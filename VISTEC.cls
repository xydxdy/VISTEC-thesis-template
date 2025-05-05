%% !TEX encoding = UTF-8 Unicode
%% Compiler: pdfLaTeX
%% Packages: TeX live version 2023
%% --------------------------------------------------------------------------
%% Author: Rattanaphon Chaisaen
%% Email: r.chaisaen@gmail.com
%% version ='1.0'

%% VISTEC Thesis Template © 2024 by Rattanaphon Chaisaen is licensed under CC BY-NC-SA 4.0 
%% --------------------------------------------------------------------------
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Try to avoid editing this file unless you know what you're doing.
%% There are 6 sections in this file:
%% 1. Option Handling
%% 2. Class Declaration
%% 3. Custom Package Loading
%% 4. Thesis Metadata and User Configuration
%% 5. Document Formatting
%% 6. Page Templates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% VISTEC disseration class
\ProvidesClass{VISTEC}










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 1. Option Handling
%%    - Degree Type, School, Compilation Flags
%%    - Example: phd, ist, showframe, showgrid
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% --------------------------------------------------------------------------
%% Required class options
%% --------------------------------------------------------------------------

% Degree type options
\newif\ifphd
\DeclareOption{phd}{\phdtrue}

\newif\ifmaster
\DeclareOption{master}{\mastertrue}

% School/program options
\newif\ifmse
\DeclareOption{mse}{\msetrue}

\newif\ifese
\DeclareOption{ese}{\esetrue}

\newif\ifbse
\DeclareOption{bse}{\bsetrue}

\newif\ifist
\DeclareOption{ist}{\isttrue}

%% --------------------------------------------------------------------------
%% Optional class options
%% --------------------------------------------------------------------------

% final layout toggles (default)
\DeclareOption{final}{%
  \let\ifdraft\iffalse%
  \let\iffinal\iftrue%
  \PassOptionsToClass{final}{report}%
}

% draft layout toggles
\newif\ifshowframe
\DeclareOption{showframe}{\showframetrue}

% grid layout toggles
\newif\ifshowgrid
\DeclareOption{showgrid}{\showgridtrue}

% Pass all unknown options to report class
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}

% Defind default option (final)
\ExecuteOptions{final}

% Process all class options
\ProcessOptions\relax










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2. Class Declaration
%%    - Load base class (report)
%%    - Set PDF size, language options, etc.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load the base class with font size 12pt
\LoadClass[12pt]{report}

%% --------------------------------------------------------------------------
%% Setup A4 PDF
%% --------------------------------------------------------------------------

\newif\ifpdf
\ifx\pdfoutput\undefined
\else
  \ifx\pdfoutput\relax
  \else
    \ifcase\pdfoutput
    \else
      \pdftrue
    \fi
  \fi
\fi

\ifpdf
  \setlength{\pdfpagewidth}{8.3in}
  \setlength{\pdfpageheight}{11.7in}
\fi


%% --------------------------------------------------------------------------
%% Encoding and Font Setup
%% --------------------------------------------------------------------------

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc} % UTF-8 encoding

%% --------------------------------------------------------------------------
%% Geometry Options
%% --------------------------------------------------------------------------
\ifshowframe
  \usepackage[a4paper, showframe]{geometry}
\else
  \usepackage[a4paper]{geometry}
\fi

%% --------------------------------------------------------------------------
%% Grid Debug Overlay
%% --------------------------------------------------------------------------

\ifshowgrid
  \usepackage[
    grid,
    gridunit=cm,
    gridcolor=blue!40,
    subgridcolor=blue!20
  ]{eso-pic}
\fi










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 3. Custom Package Loading
%%    - Fonts, layout tools, chemistry, algorithms, minted, citations
%%    - Bibliography style (Vancouver)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% --------------------------------------------------------------------------
%% Font Setup: Times New Roman
%% --------------------------------------------------------------------------

\usepackage{mathptmx} % Times font for pdfLaTeX
% \usepackage{fontspec} % Uncomment if using XeLaTeX
% \setmainfont{Times New Roman}

%% --------------------------------------------------------------------------
%% General Packages
%% --------------------------------------------------------------------------

\usepackage{booktabs}
\usepackage{multirow}
\usepackage{fancyhdr}
\usepackage{xcolor}
\usepackage{caption}
\usepackage{varwidth}
\usepackage{graphicx}
\usepackage{indentfirst}
\usepackage[title]{appendix}
\usepackage[hidelinks]{hyperref}
\usepackage[chapter]{algorithm}
\usepackage{algpseudocode}
\usepackage[newfloat]{minted}
\usepackage{listings}
\usepackage{enumitem}
\usepackage{blindtext}
\usepackage{setspace}
\usepackage{xparse}
\usepackage{newtxmath}
\usepackage{ragged2e}
\usepackage[english]{babel}
\usepackage{csquotes}
\usepackage{mfirstuc}
\usepackage{longtable}
\usepackage{microtype}
\usepackage{etoolbox}
\usepackage{afterpage}
\usepackage{comment}

%% --------------------------------------------------------------------------
%% Chemistry Packages
%% --------------------------------------------------------------------------

\usepackage[version=4]{mhchem}
\usepackage{chemfig}
\DeclareMathAlphabet{\foo}{OT1}{phv}{m}{n}
\renewcommand*\printatom[1]{\ensuremath{\foo{#1}}}

%% --------------------------------------------------------------------------
%% Bibliography Setup (Vancouver Style)
%% --------------------------------------------------------------------------

\usepackage[
  style=vancouver, 
  citestyle=numeric-comp, 
  maxbibnames=6, 
  minbibnames=6, 
  giveninits=true,
  backend=bibtex
]{biblatex}

% Bibliography Field Formatting
\DeclareFieldFormat[article]{title}{#1}
\DeclareFieldFormat[article]{journaltitle}{\mkbibbold{#1}}
\DeclareFieldFormat{title}{\mkbibbold{#1}}
\DeclareFieldFormat{booktitle}{\textnormal{#1}}
\DeclareFieldFormat{pages}{#1}
\renewcommand*{\finentrypunct}{.}

% Bibliography Layout for Article
\DeclareBibliographyDriver{article}{%
  \usebibmacro{author}%
  \setunit{\labelnamepunct}\newblock
  \printfield{title}%
  \setunit{\addperiod\space}%
  \printfield[journaltitle]{journaltitle}%
  \setunit{\addperiod\addspace}%
  \printfield{year}%
  \setunit*{\addsemicolon}%
  \printfield{volume}%
  \iffieldundef{number}
    {}
    {\printtext[parens]{\printfield{number}}}%
  \setunit*{\addcolon}%
  \printfield{pages}%
  \finentry%
}

% Bibliography Layout for Conference Papers
\DeclareBibliographyDriver{inproceedings}{%
  \usebibmacro{author}%
  \setunit{\labelnamepunct}\newblock
  \printfield{title}%
  \setunit{\addperiod\space}%
  \printfield{booktitle}%
  \setunit{\addsemicolon\space}%
  \printfield{year}%
  \setunit{\addperiod\space}%
  \printtext{p.\ }\printfield{pages}%
  \finentry%
}

% Force Full Author Names in \fullcite
\preto\fullcite{\AtNextCite{\defcounter{maxnames}{99}}}
\preto\fullcite{\AtNextCite{\defcounter{minnames}{6}}}

% Avoid Overfull HBox in Bibliography
\appto\bibsetup{\sloppy}










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 4. Thesis Metadata and User Configuration
%%    - \title, \author, \advisor, \committee, etc.
%%    - Loaded from thesisinfo.tex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% --------------------------------------------------------------------------
%% Default Internal Variables (with placeholders)
%% --------------------------------------------------------------------------

\newcommand{\@titlesize}{\Large}
\newcommand{\@subtitlesize}{\large}
\newcommand{\@authortitle}{\normalsize}
\newcommand{\@authorsize}{\normalsize}
\newcommand{\@studentid}{1888888}
\newcommand{\@program}{<<The program>>}
\newcommand{\@examinationday}{1}
\newcommand{\@examinationordinalnum}{st}
\newcommand{\@examinationmonth}{January}
\newcommand{\@examinationyear}{2022}
\newcommand{\@academicyear}{2022}
\newcommand{\@advisor}{The advisor}
\newcommand{\@memberone}{The first committee member}
\newcommand{\@membertwo}{The second committee member}
\newcommand{\@memberthree}{The third committee member}
\newcommand{\@memberfour}{The fourth committee member}
\newcommand{\@memberfive}{The fifth committee member}
\newcommand{\@membersix}{The sixth committee member}
\newcommand{\@memberseven}{The seventh committee member}
\newcommand{\@membereight}{The eighth committee member}
\newcommand{\@gradcommittee}{grad studies committee name}
\newcommand{\@degreefield}{<<The degree field>>}
\newcommand{\@school}{<<The school>>}
\newcommand{\@institute}{Vidyasirimedhi Institute of Science and Technology}
\newcommand{\@logo}{figures/logo_vistec.png}

%% --------------------------------------------------------------------------
%% Automatic Degree and School Info from Class Options
%% --------------------------------------------------------------------------

\ifphd
  \renewcommand{\@degreefield}{Doctor of Philosophy}
\fi

\ifmaster
  \renewcommand{\@degreefield}{Master of Engineering}
\fi

\ifist
  \renewcommand{\@school}{School of Information Science and Technology}
  \renewcommand{\@program}{Information Science and Technology}
\fi

\ifmse
  \renewcommand{\@school}{School of Molecular Science and Engineering}
  \renewcommand{\@program}{Materials Science and Engineering}
\fi

\ifese
  \renewcommand{\@school}{School of Energy Science and Engineering}
  \renewcommand{\@program}{Chemical Engineering}
\fi

\ifbse
  \renewcommand{\@school}{School of Biomolecular Science and Engineering}
  \renewcommand{\@program}{Biomolecular Science and Engineering}
\fi

%% --------------------------------------------------------------------------
%% Public Commands for User Configuration (used in thesisinfo.tex)
%% --------------------------------------------------------------------------

\newcommand{\titlesize}[1]{\renewcommand{\@titlesize}{#1}}
\newcommand{\subtitlesize}[1]{\renewcommand{\@subtitlesize}{#1}}
\newcommand{\authortitle}[1]{\renewcommand{\@authortitle}{#1}}
\newcommand{\authorsize}[1]{\renewcommand{\@authorsize}{#1}}
\newcommand{\studentid}[1]{\renewcommand{\@studentid}{#1}}
\newcommand{\program}[1]{\renewcommand{\@program}{#1}}
\newcommand{\examinationdate}[3]{%
  \renewcommand{\@examinationday}{#1}
  \renewcommand{\@examinationmonth}{#2}
  \renewcommand{\@examinationyear}{#3}
}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}
\newcommand{\advisor}[1]{\renewcommand{\@advisor}{#1}}
\newcommand{\memberone}[1]{\renewcommand{\@memberone}{#1}}
\newcommand{\membertwo}[1]{\renewcommand{\@membertwo}{#1}}
\newcommand{\memberthree}[1]{\renewcommand{\@memberthree}{#1}}
\newcommand{\memberfour}[1]{\renewcommand{\@memberfour}{#1}}
\newcommand{\memberfive}[1]{\renewcommand{\@memberfive}{#1}}
\newcommand{\membersix}[1]{\renewcommand{\@membersix}{#1}}
\newcommand{\memberseven}[1]{\renewcommand{\@memberseven}{#1}}
\newcommand{\membereight}[1]{\renewcommand{\@membereight}{#1}}
\newcommand{\gradcommittee}[1]{\renewcommand{\@gradcommittee}{#1}}
\newcommand{\degreefield}[1]{\renewcommand{\@degreefield}{#1}}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}
\newcommand{\institute}[1]{\renewcommand{\@institute}{#1}}
\newcommand{\logo}[1]{\renewcommand{\@logo}{#1}}











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 5. Document Formatting
%%    - Font size, spacing, paragraph styles
%%    - Hyphenation, color, header/footer settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set URL style to match the document font
\urlstyle{same}

%% --------------------------------------------------------------------------
%% Define font size and spacing
%% --------------------------------------------------------------------------

% Redefine font sizes
\newcommand\HUGE{\normalfont\fontsize{24pt}{24pt}\selectfont}
\renewcommand\huge{\normalfont\fontsize{20pt}{20pt}\selectfont}
\renewcommand\LARGE{\normalfont\fontsize{18pt}{18pt}\selectfont}
\renewcommand\Large{\normalfont\fontsize{16pt}{16pt}\selectfont}
\renewcommand\large{\normalfont\fontsize{14pt}{14pt}\selectfont}
\renewcommand\normalsize{\normalfont\fontsize{12pt}{12pt}\selectfont}
\renewcommand\small{\normalfont\fontsize{11pt}{11pt}\selectfont}
\renewcommand\footnotesize{\normalfont\fontsize{10pt}{10pt}\selectfont}
\renewcommand\scriptsize{\normalfont\fontsize{9pt}{9pt}\selectfont}
\renewcommand\tiny{\normalfont\fontsize{8pt}{8pt}\selectfont}

% Redefine Spacing
\newcommand{\realsinglespacing}{%
  \let\CS=\@currsize
  \renewcommand{\baselinestretch}{1.0}\CS\selectfont}
\renewcommand{\singlespacing}{%
  \let\CS=\@currsize
  \renewcommand{\baselinestretch}{1.0}\CS\selectfont}
\newcommand{\singlespacingplus}{%
  \let\CS=\@currsize
  \renewcommand{\baselinestretch}{1.5}\CS\selectfont}
\renewcommand{\doublespacing}{%
  \let\CS=\@currsize
  \renewcommand{\baselinestretch}{2.0}\CS\selectfont}
\newcommand{\realdoublespacing}{%
  \let\CS=\@currsize
  \renewcommand{\baselinestretch}{2.0}\CS\selectfont}
  
\newcommand{\normalspacing}{\singlespacingplus}
\newcommand{\footnotespacing}{\singlespacing}
\newcommand{\listspacing}[1]{\singlespacing} % Extra argument is an extensibility hook

% Change spacing dynamically
\newcommand{\changespacing}[2]{%
  \renewcommand{#1}{%
      \let\CS=\@currsize\renewcommand{\baselinestretch}{#2}\CS\selectfont
    }%
}

\newcommand{\changenormalspacing}[1]{\renewcommand{\normalspacing}{#1}}
\normalspacing

% Reset settings for floating environments
\def\@floatboxreset {%
    \reset@font
    \normalsize
    \singlespacing
    \@setminipage
}

%% --------------------------------------------------------------------------
%% Page Number Positioning
%% --------------------------------------------------------------------------

% Page style for chapter opening pages: no page number on the first page of the chapter
\fancypagestyle{plain}{%
  \fancyhf{} % Clear all header and footer fields
  \fancyfoot[C]{\thepage} % Set page number in the center of the footer
  \renewcommand{\headrulewidth}{0pt} % Remove header rule
  \renewcommand{\footrulewidth}{0pt} % Remove footer rule
}

% Page style for the first page, with page number in the footer
\fancypagestyle{firstpage}{%
  \fancyhf{} % Clear all header and footer fields
  \fancyfoot[C]{\normalsize\thepage} % Set page number in the center of the footer
  \renewcommand{\headrulewidth}{0pt} % Remove header rule
  \renewcommand{\footrulewidth}{0pt} % Remove footer rule
}

\setlength\footskip{1cm} % Set the distance from the bottom of the text to the page number
\raggedbottom            % Prevent pages from automatically adjusting for full-page alignment
    

%% --------------------------------------------------------------------------
%% Footnote Formatting
%% --------------------------------------------------------------------------

\renewcommand{\@makefntext}[1]{%
  \parindent 1em%
  \noindent
  \footnotespacing
  \footnotesize
  \hbox to 5em{\hss\@makefnmark}#1
  \par
}

% Default script ratio adjustments for footnotes
\renewcommand{\defaultscriptratio}{.75}
\renewcommand{\defaultscriptscriptratio}{.6}

%% --------------------------------------------------------------------------
%% Custom Paragraph Indentation
%% --------------------------------------------------------------------------

\newcommand\myindent[1]{%
  \noindent
  \setlength{\parindent}{#1}
  \indent
}% Usage example: \myindent{1.75cm}

%% --------------------------------------------------------------------------
%% Enumerate and Itemize Settings
%% --------------------------------------------------------------------------

% Define indentation levels for different nested lists
\def\paritemindent{1.65cm}
\def\subparitemindent{2.8cm}
\def\subsubparitemindent{4cm}
    
% Enumerate list settings
\setlist[enumerate]{
  label={\arabic*)},
  leftmargin=0cm,
  topsep=0pt,
  itemsep=0pt,
  parsep=0ex,
  partopsep=0pt
}

% Itemize list settings
\setlist[itemize]{
  leftmargin=0cm,
  topsep=0pt,
  itemsep=0pt,
  parsep=0ex,
  partopsep=0pt
}

%% --------------------------------------------------------------------------
%% Figure Caption Settings
%% --------------------------------------------------------------------------

% Custom long caption command to repeat content in the list of figures/tables
\newcommand{\longcaption}[2][]{\caption[#1]{#1 #2}}

% Define custom caption format for figures (ragged centered alignment)
\DeclareCaptionFormat{raggedcenterfig}{%
  \setlength{\columnsep}{\widthof{#1#2}}%
  \begin{varwidth}[t]{\textwidth}%
    \normalsize\singlespacingplus%
    \leftskip\columnsep%
    \parindent -\columnsep%
    \makebox[\columnsep][l]{\bfseries #1}#3%
  \end{varwidth}\par%
}
\captionsetup[figure]{format=raggedcenterfig}

%% --------------------------------------------------------------------------
%% Table Caption Settings
%% --------------------------------------------------------------------------

% Define custom caption format for tables (ragged left alignment with hanging indent)
\DeclareCaptionFormat{raggedlefthangtable}{%
  \setlength{\columnsep}{\widthof{#1#2}}%
  \normalsize\singlespacingplus%
  \leftskip 0cm%
  \hangindent\columnsep%
  \makebox[\columnsep][l]{\bfseries #1}#3%
  \par
}
\captionsetup[table]{format=raggedlefthangtable}

%% --------------------------------------------------------------------------
%% Listings Formatting
%% Source Codes Formatting
%% --------------------------------------------------------------------------

% Set the default style for minted code listings
\setminted{%
  fontsize=\small,
  baselinestretch=1,
  linenos=True,
  frame=lines,
  framesep=2mm
}

%% --------------------------------------------------------------------------
%% Listing Caption Settings / Source Code Caption Settings
%% --------------------------------------------------------------------------

% Custom Caption Format for Code Listings (ragged left alignment)
\DeclareCaptionFormat{raggedlefthangcode}{%
  \setlength{\columnsep}{\widthof{#1#2}}
  \begin{varwidth}[t]{\textwidth}%
    \normalsize\singlespacingplus
    \leftskip\columnsep
    \parindent -\columnsep
    \makebox[\columnsep][l]{\bfseries #1}#3%
  \end{varwidth}\par%
  \vspace{-1em} % Adjust vertical space after caption
}

% Apply the custom caption format to listings (Source Code)
\captionsetup[listing]{%
  format=raggedlefthangcode,
  name=Source Code
}
 % listings numbering format
\renewcommand{\thelisting}{\arabic{chapter}.\arabic{listing}} 

%% --------------------------------------------------------------------------
%% Algorithm Formatting and Algorithm Caption Settings
%% --------------------------------------------------------------------------

 % algorithms numbering format
\renewcommand{\thealgorithm}{\arabic{chapter}.\arabic{algorithm}} 

% Custom Caption Format for Algorithms
\DeclareCaptionFormat{raggedlefthangalgo}{%
  \setlength{\columnsep}{\widthof{#1#2}}
  \begin{varwidth}[t]{\textwidth}%
    \normalsize\singlespacingplus\leftskip\columnsep\parindent -\columnsep\makebox[\columnsep][l]{\bfseries #1}#3%
  \end{varwidth}\par%
}

% Apply the custom caption format to algorithms
\captionsetup[algorithm]{%
  format=raggedlefthangalgo,
  name=Algorithm
}

%% --------------------------------------------------------------------------
%% Section and Paragraph Formatting
%% --------------------------------------------------------------------------

% Adjust autoref naming for different levels in English
\addto\extrasenglish{%
  \renewcommand{\chapterautorefname}{Chapter}%
  \renewcommand{\sectionautorefname}{Section}%
  \renewcommand{\subsectionautorefname}{Section}%
  \renewcommand{\subsubsectionautorefname}{Section}%
}
% Custom section numbering format
\DeclareRobustCommand{\@seccntformat}[1]{%
  \def\temp@@a{#1}%
  \def\temp@@b{section}%
  \def\temp@@c{subsection}%
  \ifx\temp@@a\temp@@b
    \noindent\makebox[\firstsectionindent][l]{\csname the#1\endcsname}\hfil
  \else
    \ifx\temp@@a\temp@@c
      \noindent\makebox[\secondsectionindent][r]{\csname the#1\endcsname\hskip 0.4em}\hfil
    \else
      \noindent\makebox[\thirdsectionindent][r]{\csname the#1\endcsname\hskip 0.3em}\hfil
    \fi
  \fi
} % space between section number and text

% Custom hanging indent definition
\def\@hangfrom#1{%
  \setbox\@tempboxa\hbox{{#1}}%
  \hangindent 0pt % No hanging indent
  \noindent\box\@tempboxa
}

% Define indentation levels for section headers
\newlength{\firstsectionindent}
\setlength{\firstsectionindent}{1.25cm}

\newlength{\secondsectionindent}
\setlength{\secondsectionindent}{2.25cm}

\newlength{\thirdsectionindent}
\setlength{\thirdsectionindent}{3.5cm}

% Custom Section Formatting
\renewcommand\section{
  \parskip 1.5ex
  \leftskip 0pt\@startsection{section}{1}
  {\z@}% indent
  {6pt}% <space before>
  {0.1pt}% <space after>
  {\large\bfseries}
}

% Custom Subsection Formatting
\renewcommand\subsection{
  \parskip 1.5ex
  \leftskip 0pt\@startsection{subsection}{2}
  {\z@}% indent
  {6pt}% <space before>
  {0.1pt}% <space after>
  {\normalsize\bfseries}
}

% Custom Subsubsection Formatting
\renewcommand\subsubsection{
  \parskip 1.5ex
  \leftskip 0pt\@startsection{subsubsection}{2}
  {\z@}% indent
  {6pt}% <space before>
  {0.1pt}% <space after>
  {\normalsize\bfseries}
}

% Custom Paragraph Formatting
\renewcommand\paragraph{%
  \par%
  \setlength{\parindent}{1.25cm}%
  \setlength{\parskip}{6pt}%
  \normalfont\selectfont%
}

% Custom Subparagraph Formatting
\renewcommand\subparagraph{%
  \par%
  \setlength{\parindent}{2.25cm}%
  \setlength{\parskip}{6pt}%
  \normalfont\selectfont%
}

% Custom Subsubparagraph Formatting
\newcommand\subsubparagraph{%
  \par%
  \setlength{\parindent}{3.5cm}%
  \setlength{\parskip}{6pt}%
  \normalfont\selectfont%
}


%% --------------------------------------------------------------------------
%% Table of Contents Formatting
%% --------------------------------------------------------------------------

% Custom chapter definition to add to the Table of Contents
\newif\ifinappendix
\inappendixfalse

\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    \addcontentsline{toc}{chapter}{%
      \noindent
      \makebox[\widthof{Chapter X}][l]{%
        \ifinappendix
          Appendix~\thechapter%
        \else
          Chapter~\thechapter%
        \fi
      }%
      \ifinappendix
        \hskip 1.2em
      \else
        \hskip 0.2em
      \fi
      #1%
    }%
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \@makechapterhead{#2}%
  \@afterheading
}

% Customize ToC formatting for chapters entries
\renewcommand*\l@chapter[2]{%
\ifnum \c@tocdepth >\m@ne
  \addpenalty{-\@highpenalty}%
  % \hangindent=1cm
  \setlength\@tempdima{0em}%
  \setlength\leftskip{0em}
  \begingroup
    \parindent
    \z@ \rightskip \@pnumwidth
    \parfillskip -\@pnumwidth
    \leavevmode %\bfseries
    \advance\leftskip\@tempdima
    \hskip -\leftskip
    #1\nobreak
    \leaders\hbox{.}
    \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \penalty\@highpenalty
  \endgroup
\fi}

\newcommand\splitarg[1]{%
  \setsepchar{ }%
  \readlist\myarg{#1}%
}

%% Customize ToC formatting for section entries
\renewcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \hangindent=1.85cm % Hanging indent for wrapped lines
    \setlength\@tempdima{2em}% indent before section text
    \begingroup
      \parindent\z@
      \rightskip\@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \hskip 1.85cm % indent section label (1.1) from margin
      #1%\quad      % section number + consistent spacing before title
      \nobreak
      \leaders\hbox{.}\hfill
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi
}

%% Customize ToC formatting for subsections
\renewcommand*\l@subsection[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty{-\@highpenalty}%
    \hangindent=2.7cm % hanging indent for wrapped lines
    \setlength\@tempdima{2.5em}% alignment reference for text block
    \begingroup
      \parindent\z@
      \rightskip\@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \hskip 2.7cm  % indent label from margin (aligns with hangindent)
      #1%\quad       % label (e.g., 1.1.1) and space before title
      \nobreak
      \leaders\hbox{.}\hfill
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi
}

%% --------------------------------------------------------------------------
%% List of Tables Formatting
%% --------------------------------------------------------------------------

% Custom definition of dotted ToC line for the list of tables.
\def\@dottedtocline#1#2#3#4#5{%

    \ifnum 
      #1>\c@tocdepth 
    \else
      \leftskip0.1cm
      \setlength{\parskip}{1.5pt}
      \begin{tabular}{p{0.80\linewidth}p{0.10\linewidth}}
        \begingroup
          \leftskip #2\relax \rightskip 
          \@tocrmarg \parfillskip -\rightskip \parindent #2\relax 
          \@afterindenttrue \interlinepenalty \@M \leavevmode 
          \@tempdima #3\relax 
          \advance \leftskip \@tempdima \null \nobreak 
          \hskip -\leftskip {#4}\nobreak %
          \hfill \nobreak 
          \hb@xt@ \@pnumwidth {\hfil}%     
        \endgroup
        & 
        \begingroup
        {\hfil#5}
        \endgroup
      \end{tabular}
    \fi
}










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 6. Page Templates
%%    - Title page, pproval page, list of figures/tables (cont.), TOC
%%    - Geometry control for individual sections
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% --------------------------------------------------------------------------
%% Blank Page Formatting
%% --------------------------------------------------------------------------
\newcommand\realblankpage{%
  \null
  \thispagestyle{empty}% no page number
  \addtocounter{page}{-1}% not counted in this page
  \newpage
}

\newcommand\blankpage{%
  \null
  \thispagestyle{plain}% show page numbering
  \newpage
}

%% --------------------------------------------------------------------------
%% Chapter Page Formatting
%% --------------------------------------------------------------------------

\def\@makechapterhead#1{%
  \clearpage
  \pagestyle{plain} % page number in the footer
  \thispagestyle{empty} % no page number on the first page of the chapter
  
  \newgeometry{
    left   = 3.75cm,
    right  = 2.5cm,
    top    = 3.75cm,
    bottom = 2.5cm,
  }

  \begin{center}%
    {\Large\bfseries
    \vspace*{16pt}
    \@chapapp\space\thechapter\\
    \vspace*{16pt}
    #1
    \vspace*{16pt}}
  \end{center}%
}

\def\@makeschapterhead#1{%
  \begin{center}%
  \Large\bfseries 
  \vspace*{16pt}
  #1
  \vspace*{16pt}
  \end{center}%
}

%% --------------------------------------------------------------------------
%% Title Page Formatting
%% --------------------------------------------------------------------------

\renewcommand{\maketitle}{
  \newgeometry{
    left   = 3.75cm,
    right  = 2.5cm,
    top    = 2.5cm,
    bottom = 2.5cm,
  }
  \begin{titlepage}
    \begin{center}
      % Logo
      \includegraphics[height=2.18cm]{\@logo}
      \vspace{14pt}
      
      % Title
      \large\normalfont\singlespacingplus\MakeUppercase{\@title}
    \end{center}
    
    \vfill
    
    % Author Information
    \begin{center}
      \large\normalfont\singlespacingplus\MakeUppercase{\@author} \\
      ID \@studentid
    \end{center}
    
    \vfill
    
    % Thesis Information
    \begin{center}
      \large\normalfont\singlespacingplus
      A THESIS SUBMITTED TO \\
      \MakeUppercase{\@institute} \\
      IN PARTIAL FULFILLMENT OF THE REQUIREMENTS FOR \\
      THE DEGREE OF \MakeUppercase{\@degreefield} \\
      IN \MakeUppercase{\@program} \\~\\
      \@academicyear
    \end{center}
    
    \vspace{-1em}
  \end{titlepage}
}

% Title Page Environment Setup
\renewenvironment{titlepage}{%
  \typeout{Title page}
  \pagestyle{empty} % no page number
}{%
  \clearpage
}

%% --------------------------------------------------------------------------
%% Approval Page Formatting
%% --------------------------------------------------------------------------

\newcommand{\makeapproval}[1]{
  \clearpage
  \hyphenation{technology}
  \hyphenation{international}
  \hyphenation{engineering}
  
  \newgeometry{
    left   = 3.75cm,
    right  = 2.5cm,
    top    = 2.5cm, 
    bottom = 2.5cm,
  }
  \pagestyle{empty} % no page number
  % Approval Information Table
  \noindent
  \normalfont\normalsize
  \begin{tabular}{p{0.1725\linewidth}p{0.7825\linewidth}}
    \\~\\% two line spaces
    \leftskip-0.1in Title: & \@title \\
    \leftskip-0.1in Advisor: & \@advisor \\
    \leftskip-0.1in Name: & \@authortitle \ \@author \\
    \leftskip-0.1in Program: & {\@degreefield} Program in {\@program} (International Program) \\
  \end{tabular} \\[1ex]
  Examination Date {\@examinationday} {\@examinationmonth} {\@examinationyear} \\
  \rule{\linewidth}{0.5pt}
  \\[1ex]
  {\@institute} approved this thesis as a partial fulfillment of the requirements for the degree of {\@degreefield} in {\@program}.

  \vskip 1\baselineskip

    % Define Committee Members
  \def\tmpone{The first committee member}
  \def\tmptwo{The second committee member}
  \def\tmpthree{The third committee member}
  \def\tmpfour{The fourth committee member}
  \def\tmpfive{The fifth committee member}
  \def\tmpsix{The sixth committee member}
  \def\tmpseven{The seventh committee member}
  \def\tmpeight{The eighth committee member}
  
  \def\memone{\@memberone}
  \def\memtwo{\@membertwo}
  \def\memthree{\@memberthree}
  \def\memfour{\@memberfour}
  \def\memfive{\@memberfive}
  \def\memsix{\@membersix}
  \def\memseven{\@memberseven}
  \def\memeight{\@membereight}
  
  % Examination Committee Information
  \par\noindent Examination Committee:
  \vskip 1\baselineskip
  \noindent

  \begin{table}[h]
    \centering
    \singlespacingplus
    \begin{tabular}{p{0.5\linewidth} p{0.5\linewidth}}
      \ifthenelse{\equal\tmpone\memone}{}{
        \begin{tabular}[c]{@{}l@{}} .......................................... Chairperson \\ (\@memberone) \end{tabular}
      }
      \ifthenelse{\equal\tmptwo\memtwo}{& \\}{
        & \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@membertwo) \end{tabular} \\~\\
      }

      \ifthenelse{\equal\tmpthree\memthree}{}{
        \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@memberthree) \end{tabular}
      }
      \ifthenelse{\equal\tmpfour\memfour}{& \\}{
        & \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@memberfour) \end{tabular} \\~\\
      }

      \ifthenelse{\equal\tmpfive\memfive}{}{
        \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@memberfive) \end{tabular}
      }
      \ifthenelse{\equal\tmpsix\memsix}{& \\}{
        & \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@membersix) \end{tabular} \\~\\
      }

      \ifthenelse{\equal\tmpseven\memseven}{}{
        \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@memberseven) \end{tabular}
      }
      \ifthenelse{\equal\tmpeight\memeight}{& \\}{
        & \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@membereight) \end{tabular} \\~\\
      }
    \end{tabular}
  \end{table}

  \vfill
  
    % Graduate Committee Approval
  \begin{table}[h]
    \singlespacingplus
    \begin{tabular}{p{0.5\linewidth} p{0.5\linewidth}}
      \multicolumn{1}{l}{
        \begin{tabular}[c]{@{}c@{}} \\~\\ ............................................................... \\ (\@gradcommittee) \\ Chairperson \\ Graduate Studies Committee \end{tabular}
      }
      & \multicolumn{1}{l}{}
    \end{tabular}
  \end{table}
  \vspace{-1.5em}

  \clearpage
}

%% --------------------------------------------------------------------------
%% Abstract Page Formatting
%% --------------------------------------------------------------------------

\renewenvironment{abstract}{
  \typeout{Abstract}
  \label{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
  \clearpage
  \newgeometry{
    left   = 3.75cm,
    right  = 2.5cm,
    top    = 5cm, 
    bottom = 2.5cm,
  }
  \pagestyle{plain} % show page numbering

  % Abstract Title Section
  \begin{center}
    {\singlespacingplus\Large\normalfont{\@title}\\~\\}
    {\singlespacingplus\Large\normalfont{\bfseries{Abstract}}\\~\\}
    {\singlespacingplus\normalsize\normalfont{\@author}\\~\\}
  \end{center}
  
  % Abstract Text
  {\setlength\parindent{1.25cm}
  \normalfont\normalsize\singlespacingplus\par
  \input{contents/abstract}}
  
  \clearpage
}

\newenvironment{keywords}[1]{
\vfill
\noindent
\normalfont\normalsize\singlespacingplus
\begin{tabular}{@{}p{0.1\textwidth} p{0.87\textwidth}@{}}%
Keywords: & #1.
\end{tabular}
}{}

%% --------------------------------------------------------------------------
%% Acknowledgment Page Formatting
%% --------------------------------------------------------------------------

\newenvironment{acknowledgment}{%
  \clearpage
  \newgeometry{
    left   = 3.75cm,
    right  = 2.5cm,
    top    = 5cm, 
    bottom = 2.5cm,
  }
  \pagestyle{plain} % show page numbering
  \addcontentsline{toc}{chapter}{Acknowledgment}
  \typeout{acknowledgment}

    % Acknowledgment Title Section
  \begin{center}%
    {\singlespacingplus\normalfont\Large\bfseries{Acknowledgment}\\~\\}
  \end{center}

  % Acknowledgment Content
  \setlength\parindent{1.25cm}
  \normalfont\normalsize\singlespacingplus\par
  \input{contents/acknowledgment}

  % Author Signature Section
  \vspace{54pt} % 3 line x 12 pt x 1.5
  
  \newlength{\signaturewidth}
  \settowidth{\signaturewidth}{\@author}
  \settowidth{\@tempdima}{{\@examinationday} {\@examinationmonth} {\@examinationyear}}
  \ifdim\@tempdima>\signaturewidth
    \setlength{\signaturewidth}{\@tempdima}
  \fi
  
  % Create dynamic layout
  \noindent
  \makebox[\dimexpr\textwidth-\signaturewidth\relax][l]{}%
  \makebox[\signaturewidth][c]{%
    \begin{tabular}{c}
      \@author \\
      {\@examinationday} {\@examinationmonth} {\@examinationyear}
    \end{tabular}
  }

  \clearpage
}

%% --------------------------------------------------------------------------
%% Appendix Page Formatting
%% --------------------------------------------------------------------------

\let\oldappendix\appendix
\renewcommand{\appendix}{%
  \clearpage
  \pagestyle{plain} % show page numbering
  \thispagestyle{empty} % no page number on the first page
  \oldappendix
  \inappendixtrue
  % Redefine the chapter name printed in headings and ToC
  % \renewcommand{\chaptername}{Appendix}
  
  % Change chapter numbering to letters (A, B, C...)
  \renewcommand{\thechapter}{\Alph{chapter}}
  
  % Change section numbering to A.1, A.2, etc.
  \renewcommand{\thesection}{\thechapter.\arabic{section}}
}

%% --------------------------------------------------------------------------
%% Author's Biography Page Formatting
%% --------------------------------------------------------------------------

\newenvironment{authorbiography}{
  \clearpage
  \pagestyle{plain} % Show page numbering
  \addcontentsline{toc}{chapter}{Author’s Biography}
  \typeout{authorbiography}
  
  % Author's Biography Title
  \noindent
  \begin{center}
    {\Large\normalfont\bfseries{Author’s Biography}\\~\\}
  \end{center}
  
  % Author's Biography Content
  \noindent
  \normalsize
  \input{contents/authorbiography}
  
  \clearpage
  \afterpage{\realblankpage}
}

%% --------------------------------------------------------------------------
%% References Page Formatting
%% --------------------------------------------------------------------------

\DeclareBibliographyCategory{exclude}

\newcommand{\vancouverbib}{
  \clearpage
  \addcontentsline{toc}{chapter}{References}

    % Title for References
  \begin{center}%
    {\Large\bfseries{References}}
    \normalsize\\~\\
  \end{center}
  
  % Set formatting for the references
  \singlespacingplus\normalsize
  \setlength\bibitemsep{0pt}
  
  % Print the bibliography without an additional heading
  \printbibliography[heading=none, notcategory=exclude]
  
  \clearpage
}

%% --------------------------------------------------------------------------
%% Table of Contents Page Formatting
%% --------------------------------------------------------------------------

% First page Table of Contents header
\newcommand{\tocheader}{%
  \begin{center}
    {\Large\bfseries \contentsname} \normalsize\\~\\
    {} \hfill Page
    \vspace{-1em}
  \end{center}
}

% Continuation ToC header
\newcommand{\toccontheader}{%
  \begin{center}
    {\Large\bfseries \contentsname~(Cont.)} \normalsize\\~\\
    {} \hfill Page
    \vspace{-1em}
  \end{center}
}

% Custom Table of Contents Command
\renewcommand\tableofcontents{%
  \clearpage
  \pagestyle{plain} % show page numbering
  \fancyfoot[c]{\thepage}

  \newgeometry{
    top    = 5cm,
    bottom = 2.5cm,
    left   = 3.75cm,
    right  = 2.5cm,
  }

  % Flag to detect first page
  \newif\if@firsttocpage
  \@firsttocpagetrue

  \begingroup
    % Patch \@opcol to inject headers for each page
    \patchcmd{\@opcol}
      {\@outputpage}
      {%
        \if@firsttocpage
          \global\@firsttocpagefalse
          \toccontheader
        \else
          \toccontheader
        \fi
        \@outputpage
      }{}{}
    \tocheader
    \@starttoc{toc}%
  \endgroup

  \restoregeometry
  \clearpage
}

%% --------------------------------------------------------------------------
%% List of Tables Page Formatting
%% --------------------------------------------------------------------------

% Redefine table formatting in the List of Tables
\renewcommand{\l@table}{
    \@dottedtocline{1}{0cm}{1.5cm}
}

% First page List of Tables header
\newcommand{\lotheader}{%
  \begin{center}
    {\Large\bfseries \listtablename} \normalsize\\~\\
    \tablename \hfill Page
    \vspace{-1em}
  \end{center}
}

% Continuation List of Tables header
\newcommand{\lotcontheader}{%
  \begin{center}
    {\Large\bfseries \listtablename~(Cont.)} \normalsize\\~\\
    \tablename \hfill Page
    \vspace{-1em}
  \end{center}
}

% Custom List of Tables command
\renewcommand\listoftables{%
  \clearpage
  \pagestyle{plain} % show page numbering
  \fancyfoot[c]{\thepage}

  \newgeometry{
    top    = 5cm,
    bottom = 2.5cm,
    left   = 3.75cm,
    right  = 2.5cm,
  }

  % Add List of Tables to the ToC
  \addcontentsline{toc}{chapter}{\listtablename}

  % Flag to detect first page
  \newif\if@firstlotpage
  \@firstlotpagetrue

  \begingroup
    % Patch \@opcol to inject headers for each page
    \patchcmd{\@opcol}
      {\@outputpage}
      {%
        \if@firstlotpage
          \global\@firstlotpagefalse
          \lotcontheader
        \else
          \lotcontheader
        \fi
        \@outputpage
      }{}{}

    % First page header
    \lotheader

    % Generate the List of Tables
    \singlespacingplus
    \@starttoc{lot}%
  \endgroup

  \restoregeometry
  \clearpage
}

%% --------------------------------------------------------------------------
%% List of Figures Page Formatting
%% --------------------------------------------------------------------------

% Redefine figure formatting in the List of Figures
\renewcommand{\l@figure}{
  \@dottedtocline{1}{0cm}{1.5cm}
}

% First page List of Figures header
\newcommand{\lofheader}{%
  \begin{center}
    {\Large\bfseries \listfigurename} \normalsize\\~\\
    \figurename \hfill Page
    \vspace{-1em}
  \end{center}
}

% Continuation List of Figures header
\newcommand{\lofcontheader}{%
  \begin{center}
    {\Large\bfseries \listfigurename~(Cont.)} \normalsize\\~\\
    \figurename \hfill Page
    \vspace{-1em}
  \end{center}
}

% Custom List of Figures command
\renewcommand\listoffigures{%
  \clearpage
  \pagestyle{plain} % show page numbering
  \fancyfoot[c]{\thepage}

  \newgeometry{
    top    = 5cm,
    bottom = 2.5cm,
    left   = 3.75cm,
    right  = 2.5cm,
  }

  % Add List of Figures to the ToC
  \addcontentsline{toc}{chapter}{\listfigurename}

  % Flag to detect first page
  \newif\if@firstlofpage
  \@firstlofpagetrue

  \begingroup
    % Patch \@opcol to inject headers for each page
    \patchcmd{\@opcol}
      {\@outputpage}
      {%
        \if@firstlofpage
          \global\@firstlofpagefalse
          \lofcontheader
        \else
          \lofcontheader
        \fi
        \@outputpage
      }{}{}

    % First page header
    \lofheader

    % Generate the List of Figures
    \singlespacingplus
    \@starttoc{lof}%
  \endgroup

  \restoregeometry
  \clearpage
}

%% --------------------------------------------------------------------------
%% List of Listings Page Formatting
%% List of Source Codes Page Formatting
%% --------------------------------------------------------------------------

% Rename the List of Listings title
\renewcommand{\listingname}{Source Code} % Listing -> Source Code
\renewcommand{\listlistingname}{List of \listingname s}

% Define List of Listings based on List of Figures
\let\l@listing\l@figure
\let\lstlistoflistings\listoffigures

% Modify the list to use "lol" instead of "lof"
\patchcmd{\lstlistoflistings}{\@starttoc{lof}}{\@starttoc{lol}}{}{}%

% Adjust how the List of Listings is added to the Table of Contents
\patchcmd{\@chapter}{\addtocontents}{%
  \addtocontents{lol}{}%
  \addtocontents}{}{}%=

% Define the formatting for each listing in the List of Listings
\renewcommand{\l@listing}{
  \@dottedtocline{1}{0cm}{1.5cm}%
}

% First page List of Listings header
\newcommand{\lolheader}{%
  \begin{center}
    {\Large\bfseries \listlistingname} \normalsize\\~\\
    \listingname \hfill Page
    \vspace{-1em}
  \end{center}
}

% Continuation List of Listings header
\newcommand{\lolcontheader}{%
  \begin{center}
    {\Large\bfseries \listlistingname~(Cont.)} \normalsize\\~\\
    \listingname \hfill Page
    \vspace{-1em}
  \end{center}
}

% Redefine List of Listings command
\renewcommand{\lstlistoflistings}{%
  \clearpage
  \pagestyle{plain} % show page numbering
  \fancyfoot[c]{\thepage}

  \newgeometry{
    top    = 5cm,
    bottom = 2.5cm,
    left   = 3.75cm,
    right  = 2.5cm,
  }

  % Add List of Listings to the Table of Contents
  \addcontentsline{toc}{chapter}{\listlistingname}

  % Flag to detect first page
  \newif\if@firstlolpage
  \@firstlolpagetrue

  \begingroup
    % Patch \@opcol to inject headers for each page
    \patchcmd{\@opcol}
      {\@outputpage}
      {%
        \if@firstlolpage
          \global\@firstlolpagefalse
          \lolcontheader
        \else
          \lolcontheader
        \fi
        \@outputpage
      }{}{}

    % First page header
    \lolheader

    % Start the List of Listings
    \@starttoc{lol}%
  \endgroup

  \restoregeometry
  \clearpage
}   

%% --------------------------------------------------------------------------
%% List of Algorithms Page Formatting
%% --------------------------------------------------------------------------

% Define List of Algorithms based on List of Tables
\let\l@algorithm\l@table
\let\listofalgorithms\listoftables

% Modify the list to use "loa" instead of "lot"
\patchcmd{\listofalgorithms}{\@starttoc{lot}}{\@starttoc{loa}}{}{}%

% Adjust how the List of Algorithms is added to the Table of Contents
\patchcmd{\@chapter}{\addtocontents}{%
  \addtocontents{loa}{}%
  \addtocontents}{}{}%=
    
% Define the formatting for each algorithm in the List of Algorithms
\renewcommand{\l@algorithm}{
  \@dottedtocline{1}{0cm}{1.5cm}%
}

% Custom Algorithm Naming
\newcommand{\algorithmname}{Algorithm}
% Rename the List of Algorithms title
\renewcommand{\listalgorithmname}{List of \algorithmname s}

% First page List of Algorithms header
\newcommand{\loaheader}{%
  \begin{center}
    {\Large\bfseries \listalgorithmname} \normalsize\\~\\
    \algorithmname \hfill Page
    \vspace{-1em}
  \end{center}
}

% Continuation List of Algorithms header
\newcommand{\loacontheader}{%
  \begin{center}
    {\Large\bfseries \listalgorithmname~(Cont.)} \normalsize\\~\\
    \algorithmname \hfill Page
    \vspace{-1em}
  \end{center}
}

% Redefine List of Algorithms command
\renewcommand\listofalgorithms{%
  \clearpage
  \pagestyle{plain} % show page numbering
  \fancyfoot[c]{\thepage}

  \newgeometry{
    top    = 5cm,
    bottom = 2.5cm,
    left   = 3.75cm,
    right  = 2.5cm,
  }

  % Add List of Algorithms to the ToC
  \addcontentsline{toc}{chapter}{\listalgorithmname}

  % Flag to detect first page
  \newif\if@firstloapage
  \@firstloapagetrue

  \begingroup
    % Patch \@opcol to inject headers for each page
    \patchcmd{\@opcol}
      {\@outputpage}
      {%
        \if@firstloapage
          \global\@firstloapagefalse
          \loacontheader
        \else
          \loacontheader
        \fi
        \@outputpage
      }{}{}

    % First page header
    \loaheader

    % Generate the List of Algorithms
    \singlespacingplus
    \@starttoc{loa}%
  \endgroup

  \restoregeometry
  \clearpage
}


%%%%%%%%%%%%%%%%%%%%% List of Abbreviations Page %%%%%%%%%%%%%%%%%%%%%%%%%
%% --------------------------------------------------------------------------
%% List of Contents Page Formatting
%% --------------------------------------------------------------------------

% Abbreviation Entry Environment
\newenvironment{newabbr}[2]{
  \myindent{0.425cm}
  \makebox[7.05cm][l]{#1}
  \hangindent=7.8cm
  \capitalisewords{#2}\par
}


% First page abbreviation header
\newcommand{\abbreviationheader}{%
  \begin{center}
    {\singlespacingplus\Large\bfseries List of Abbreviations}\normalsize\\~\\
  \end{center}
}

% Continuation header
\newcommand{\abbreviationcontheader}{%
  \begin{center}
    {\singlespacingplus\Large\bfseries List of Abbreviations (Cont.)}\normalsize\\~\\
  \end{center}
}

% Abbreviations Environment
\newenvironment{abbreviations}{%
  \clearpage
  \pagestyle{plain} % show page numbering
  \fancyfoot[c]{\thepage}

  \newgeometry{
    left   = 3.75cm,
    right  = 2.5cm,
    top    = 5cm,
    bottom = 2.5cm,
  }

  \addcontentsline{toc}{chapter}{List of Abbreviations}

  \newif\if@firstabbrevpage
  \@firstabbrevpagetrue

  \begingroup
    \patchcmd{\@opcol}
      {\@outputpage}
      {%
        \if@firstabbrevpage
          \global\@firstabbrevpagefalse
          \abbreviationcontheader
        \else
          \abbreviationcontheader
        \fi
        \@outputpage
      }{}{}

    % First page header
    \abbreviationheader

    % Load abbreviations content file
    \normalfont\normalsize\singlespacingplus
    \input{contents/abbreviations}
  \endgroup

  \restoregeometry
  \clearpage
}{}

\endinput
%% End of file `VISTEC.cls'.