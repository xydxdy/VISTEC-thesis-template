%% !TEX encoding = UTF-8 Unicode
%% Compiler: XeLaTeX
%% Packages: TeX live version 2026
%% --------------------------------------------------------------------------
%% Author: Rattanaphon Chaisaen
%% Email: r.chaisaen@gmail.com
%% version = 2.1.0

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

% \usepackage{mathptmx} % Times font for pdfLaTeX
\usepackage{fontspec} % Uncomment if using XeLaTeX
\setmainfont{Times New Roman}

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
\usepackage[export]{adjustbox} % max width / max height for images and tables
\usepackage{xurl}              % allow long URLs to break at any character

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


% Fullcite Formatting

\newtoggle{showrefnumber}
\togglefalse{showrefnumber} % default = false

\DeclareCiteCommand{\fullcite}
  {\usebibmacro{prenote}}
  {\entrydata{\thefield{entrykey}}{%
     \iftoggle{showrefnumber}{%
       % --- Show label number with table layout ---
       \begin{tabular}{@{}p{0.06\linewidth}p{0.9\linewidth}@{}}
        \quad\printtext[labelnumberwidth]{\printfield{labelnumber}}%
        &
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
        \setunit{\addperiod}
        \finentry
      \end{tabular}%
     }{%
       % --- No label number ---
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
      \setunit{\addperiod}
      \finentry
     }%
   }}
  {\multicitedelim}
  {\usebibmacro{postnote}}

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
\newcommand{\@approvaltitle}{\@title} % approval page title (defaults to \title)

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
% Title as it should break on the approval page, e.g.
% \approvaltitle{Adaptive ... Learning For EEG-\\based Brain-computer Interfaces}
\newcommand{\approvaltitle}[1]{\renewcommand{\@approvaltitle}{#1}}











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 5. Document Formatting
%%    - Font size, spacing, paragraph styles
%%    - Hyphenation, color, header/footer settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Set URL style to match the document font
\urlstyle{same}

%% --------------------------------------------------------------------------
%% Keep Content Inside the Text Area
%% Applies to every page except the approval page (\makeapproval)
%% --------------------------------------------------------------------------

% Switch: true = limit content to the text area (off on the approval page)
\newif\ifvistec@limit
\vistec@limittrue

% Paragraphs: allow a little more interword stretch instead of letting
% a line run into the margin
\setlength{\emergencystretch}{3em}
\tolerance=2000

% Images: never wider than the line or taller than the text block
\NewCommandCopy{\vistec@includegraphics}{\includegraphics}
\RenewDocumentCommand{\includegraphics}{s O{} m}{%
  \ifvistec@limit
    \IfBooleanTF{#1}%
      {\vistec@includegraphics*[#2,max width=\linewidth,max height=\textheight]{#3}}%
      {\vistec@includegraphics[#2,max width=\linewidth,max height=\textheight]{#3}}%
  \else
    \IfBooleanTF{#1}%
      {\vistec@includegraphics*[#2]{#3}}%
      {\vistec@includegraphics[#2]{#3}}%
  \fi
}

% Tables: a tabular wider than the line is scaled down to fit
% (tables that already fit are not changed)
\let\vistec@tabular\tabular
\let\vistec@endtabular\endtabular
\renewenvironment{tabular}{%
  \ifvistec@limit\begin{adjustbox}{max width=\linewidth}\fi
  \vistec@tabular
}{%
  \vistec@endtabular
  \ifvistec@limit\end{adjustbox}\fi
}

%% --------------------------------------------------------------------------
%% Define font size and spacing
%% --------------------------------------------------------------------------

% Redefine font sizes
% Line height = 1.15 x font size, which is what MS Word uses as "single"
% line spacing for Times New Roman. So 1.5 spacing = 20.7pt at 12pt,
% the same as Word's "1.5 lines".
\newcommand\HUGE{\normalfont\fontsize{24pt}{27.6pt}\selectfont}
\renewcommand\huge{\normalfont\fontsize{20pt}{23pt}\selectfont}
\renewcommand\LARGE{\normalfont\fontsize{18pt}{20.7pt}\selectfont}
\renewcommand\Large{\normalfont\fontsize{16pt}{18.4pt}\selectfont}
\renewcommand\large{\normalfont\fontsize{14pt}{16.1pt}\selectfont}
\renewcommand\normalsize{\normalfont\fontsize{12pt}{13.8pt}\selectfont}
\renewcommand\small{\normalfont\fontsize{11pt}{12.65pt}\selectfont}
\renewcommand\footnotesize{\normalfont\fontsize{10pt}{11.5pt}\selectfont}
\renewcommand\scriptsize{\normalfont\fontsize{9pt}{10.35pt}\selectfont}
\renewcommand\tiny{\normalfont\fontsize{8pt}{9.2pt}\selectfont}

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
  framesep=2mm,
  breaklines=true,     % wrap long code lines instead of running off the page
  breakanywhere=true
}

% Same for listings
\lstset{breaklines=true, breakatwhitespace=false}

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
  {\normalsize\bfseries}
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
          Appendix\hspace{0.18cm}\thechapter%
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
  \hangindent=1.85cm
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

%% Customize ToC formatting for subsubsections
\renewcommand*\l@subsubsection[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty{-\@highpenalty}%
    \hangindent=3.8cm % hanging indent for wrapped lines
    \setlength\@tempdima{3.5em}% alignment reference for text block
    \begingroup
      \parindent\z@
      \rightskip\@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \hskip 3.8cm  % indent label from margin (aligns with hangindent)
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
  \ifnum #1>\c@tocdepth \else
    \vspace{-18pt}%
    \setlength{\parskip}{0pt}%
    \setlength{\tabcolsep}{0pt}%
    \renewcommand{\arraystretch}{1.0}%

    \begin{tabular}[t]{@{}p{0.25cm}@{}p{0.78\linewidth}@{}p{0.115\linewidth}@{}}
      {} &
      \begingroup
        \@tempdima #3\relax
        \advance \leftskip \@tempdima \null \nobreak
        \hskip -\leftskip #4\nobreak
      \endgroup
      &
      \begingroup
        \vbox to 2.2ex{%
          \hfill\strut\par
          \hfill #5%
        }%
      \endgroup
    \end{tabular}%
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

% Blank page without a page number (still counted)
\newcommand\emptyblankpage{%
  \null
  \thispagestyle{empty}% no page number
  \newpage
}

%% --------------------------------------------------------------------------
%% Chapter Page Formatting
% %% --------------------------------------------------------------------------
\def\@makechapterhead#1{%
  \clearpage
  \firstpagegeometry    % first page top = 5cm, others top = 3.75cm
  \pagestyle{plain}     % page number in the footer
  \thispagestyle{empty} % no page number on the first page of the chapter

  \begin{center}%
    {\Large\bfseries
    \@chapapp\space\thechapter\\
    \vspace*{16pt}
    #1
    \vspace*{16pt}}
  \end{center}%
}

\def\@makeschapterhead#1{%
  \ifodd\value{page}\relax\else
    \blankpage
  \fi
  
  \addcontentsline{toc}{chapter}{#1}%
  
  \begin{center}%
  \Large\bfseries 
  \vspace*{16pt}
  #1
  \vspace*{16pt}
  \end{center}%
}

% Add a blank page if the page does not end with an even number
\newcommand{\includechapter}[1]{%
  \include{#1}%
  \ifodd\value{page}\relax\else\blankpage\fi
}


%% --------------------------------------------------------------------------
%% Title Page Formatting
%% --------------------------------------------------------------------------

\renewcommand{\maketitle}{
  \newgeometry{
    left   = 3.75cm,
    right  = 2.5cm,
    top    = 2.5cm,
    bottom = 2.5cm
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
      \\~\\
    \end{center}
    
    \vspace{-1em}
  \end{titlepage}  
}

% Title Page Environment Setup
\renewenvironment{titlepage}{%
  \typeout{Title page}
  \pagestyle{empty}
}{%
  \clearpage
  \afterpage{\realblankpage}
}

%% --------------------------------------------------------------------------
%% Approval Page Formatting
%% Layout taken from the VISTEC Word template (2_Template_-_Approval_Page.docx)
%%  - info rows: labels (no colon) in a 3.25cm column, 1.5 line spacing (20pt)
%%  - 0.5pt rule, 15.2cm long
%%  - committee table: columns 7.62cm | 0.42cm | 8.13cm, cell padding 0.19cm,
%%    signature/name rows 0.8cm high, 0.7cm between pairs
%%  - Graduate Studies Committee block: 22pt lines, centered in the left column
%% --------------------------------------------------------------------------

% Info row: \vistec@apprline{Label}{Value}
\newcommand{\vistec@apprline}[2]{%
  \par
  \noindent
  \hangindent=3.25cm
  \hangafter=1
  \let\\\newline % a \\ in the value breaks the line but keeps the indent
  \setbox\@tempboxa\hbox{#1}%
  \ifdim\wd\@tempboxa<3.25cm
    \makebox[3.25cm][l]{#1}%
  \else
    \box\@tempboxa\ \ % label wider than the column (e.g. Examination Date)
  \fi
  \ignorespaces#2\par
}

% Signature line: dots filling a fixed width, then the role
\newcommand{\vistec@sigline}[2]{% #1 width, #2 role
  \hbox to #1{\xleaders\hbox{…}\hfill\ #2}%
}

% One row of the committee table (left cell text, right cell text)
\newcommand{\vistec@apprrow}[2]{%
  \par
  \noindent
  \makebox[\linewidth][l]{\hspace{0.19cm}\makebox[8.04cm][l]{#1}#2}%
  \par
}

% Run #3 only if the member macro #1 is not the placeholder #2
\newcommand{\vistec@ifmember}[4]{%
  \def\vistec@tmpa{#2}%
  \expandafter\def\expandafter\vistec@tmpb\expandafter{#1}%
  \ifx\vistec@tmpa\vistec@tmpb #4\else #3\fi
}

\newif\ifvistec@firstpair
\newif\ifvistec@leftset
\newif\ifvistec@rightset
\newif\ifvistec@anyset

% A pair of committee members side by side
% #1 left member, #2 its placeholder, #3 left role,
% #4 right member, #5 its placeholder
\newcommand{\vistec@apprpair}[5]{%
  \vistec@ifmember{#1}{#2}{\vistec@leftsettrue}{\vistec@leftsetfalse}%
  \vistec@ifmember{#4}{#5}{\vistec@rightsettrue}{\vistec@rightsetfalse}%
  \vistec@anysetfalse
  \ifvistec@leftset\vistec@anysettrue\fi
  \ifvistec@rightset\vistec@anysettrue\fi
  \ifvistec@anyset
    \ifvistec@firstpair
      \global\vistec@firstpairfalse
    \else
      \vspace{0.7cm}% spacer row between pairs
    \fi
    \vistec@apprrow
      {\ifvistec@leftset\vistec@sigline{6.83cm}{#3}\fi}
      {\ifvistec@rightset\vistec@sigline{6.62cm}{Member}\fi}%
    \vistec@apprrow
      {\ifvistec@leftset(#1)\fi}
      {\ifvistec@rightset(#4)\fi}%
  \fi
}

\newcommand{\makeapproval}[1]{%
  \clearpage
  \vistec@limitfalse % approval page: keep its own layout, no width limits
  \hyphenation{technology}
  \hyphenation{international}
  \hyphenation{engineering}
  \hyphenation{fulfillment}

  \newgeometry{
    left   = 3.75cm,
    right  = 2.5cm,
    top    = 5cm,
    bottom = 2.5cm
  }
  \pagestyle{empty} % no page number
  \thispagestyle{empty}

  \begingroup
  \normalfont
  \renewcommand{\baselinestretch}{1}%
  \fontsize{12pt}{20.7pt}\selectfont % 12pt text, Word "1.5 lines" (1.5 x 13.8pt)
  \setlength{\parindent}{0pt}%
  \setlength{\parskip}{0pt}%

  % ---- Information rows -------------------------------------------------
  \begingroup
    \raggedright
    \vistec@apprline{Title}{\@approvaltitle}
    \vistec@apprline{Advisor}{\@advisor}
    \vistec@apprline{Name}{\@authortitle\ \@author}
    \begingroup
      \rightskip=-0.6cm plus 1fil % Word lets this row run 0.6cm into the margin
      \vistec@apprline{Program}{{\@degreefield} Program in {\@program}\newline (International Program)}
    \endgroup
    \vistec@apprline{Examination Date}{{\@examinationday} {\@examinationmonth} {\@examinationyear}}
  \endgroup

  % ---- Rule -------------------------------------------------------------
  \noindent\makebox[\linewidth][l]{\rule{15.2cm}{0.5pt}}\par

  % ---- Approval statement -----------------------------------------------
  {\@institute} approved this thesis as a partial fulfillment of the
  requirements for the degree of {\@degreefield} in {\@program}.\par
  \vspace{\baselineskip}%

  Examination Committee:\par

  % ---- Examination committee (2 per row) --------------------------------
  \begingroup
    \setlength{\baselineskip}{0.8cm}% row height 0.8cm
    \setlength{\lineskiplimit}{-\maxdimen}%
    \vspace{0.795cm}%
    \global\vistec@firstpairtrue
    \vistec@apprpair{\@memberone}{The first committee member}{Chairperson}%
                    {\@membertwo}{The second committee member}%
    \vistec@apprpair{\@memberthree}{The third committee member}{Member}%
                    {\@memberfour}{The fourth committee member}%
    \vistec@apprpair{\@memberfive}{The fifth committee member}{Member}%
                    {\@membersix}{The sixth committee member}%
    \vistec@apprpair{\@memberseven}{The seventh committee member}{Member}%
                    {\@membereight}{The eighth committee member}%
  \endgroup

  % ---- Graduate Studies Committee ---------------------------------------
  \begingroup
    \setlength{\baselineskip}{22pt}%
    \setlength{\lineskiplimit}{-\maxdimen}%
    \vspace{\dimexpr 2.78cm - 22pt\relax}%
    \noindent\makebox[7.62cm][c]{………………………………………..}\par
    \noindent\makebox[7.62cm][c]{(\@gradcommittee)}\par
    \noindent\makebox[7.62cm][c]{Chairperson}\par
    \noindent\makebox[7.62cm][c]{Graduate Studies Committee}\par
  \endgroup
  \endgroup

  \clearpage
  \vistec@limittrue % limits back on for the rest of the thesis
  \afterpage{\realblankpage}
}

%% --------------------------------------------------------------------------
%% First page top = 5cm, following pages top = 3.75cm (real geometry)
%% Used by: Abstract, Acknowledgment, ToC, List of Tables, List of Figures
%% --------------------------------------------------------------------------
\newlength{\firstpagetopextra}
\setlength{\firstpagetopextra}{\dimexpr 5cm - 3.75cm\relax}

\newcommand{\firstpagegeometry}{%
  % First page layout
  \newgeometry{
    inner  = 3.75cm, % left on odd pages
    outer  = 2.5cm,  % right on odd pages
    top    = 5cm,    % first page only
    bottom = 2.5cm,
    twoside
  }%
  % After the first page is shipped out, move the text block up 1.25cm
  % and make it 1.25cm taller -> top = 3.75cm from the second page on
  \AddToHookNext{shipout/after}{%
    \global\advance\topmargin  -\firstpagetopextra
    \global\advance\textheight  \firstpagetopextra
  }%
}

%% --------------------------------------------------------------------------
%% Column layout for List of Figures / List of Tables
%% | number (1.99cm) | caption (10.75cm) | page (2cm) |
%% --------------------------------------------------------------------------
\newlength{\lolabelwidth}
\setlength{\lolabelwidth}{1.99cm}
\newlength{\lotitlewidth}
\setlength{\lotitlewidth}{10.75cm}
\newlength{\lopagewidth}
\setlength{\lopagewidth}{2cm}

% One entry: #1 = \numberline{number}caption, #2 = page
\newcommand{\vistec@listentry}[2]{%
  \par
  \begingroup
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{0pt}%
    \setlength{\leftskip}{\lolabelwidth}%                     column 1
    \setlength{\rightskip}{\dimexpr\linewidth-\lolabelwidth-\lotitlewidth\relax}% column 2 = 10.75cm
    \setlength{\parfillskip}{0pt plus 1fil}%
    \renewcommand{\numberline}[1]{%
      \hskip-\lolabelwidth\makebox[\lolabelwidth][c]{##1}}%  number centered
    % Page number on the FIRST line, centered in the page column
    \noindent
    \rlap{\hskip\lotitlewidth\makebox[\rightskip][c]{#2}}%
    #1\par
  \endgroup
}

% Header row under "List of ...": #1 = "Table" or "Figure"
\newcommand{\vistec@listcolheader}[1]{%
  \par
  \begingroup
    \setlength{\parindent}{0pt}%
    \setlength{\leftskip}{0pt}%
    \setlength{\rightskip}{0pt}%
    \noindent
    \makebox[\lolabelwidth][c]{#1}%
    \makebox[\lotitlewidth]{}%
    \makebox[\dimexpr\linewidth-\lolabelwidth-\lotitlewidth\relax][c]{Page}\par
  \endgroup
}

%% --------------------------------------------------------------------------
%% Abstract Page Formatting
%% --------------------------------------------------------------------------

\renewenvironment{abstract}{
  \typeout{Abstract}
  \clearpage
  \firstpagegeometry    % first page top = 5cm, others top = 3.75cm
  \pagestyle{plain}     % show page numbering
  \thispagestyle{empty} % No page number on the first page
  \label{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}

  % Abstract Title Section
  {\centering\singlespacingplus
    {\Large\normalfont{\@title}\\~\\}
    {\Large\normalfont{\bfseries{Abstract}}\\~\\}
    {\normalsize\normalfont{\@author}\\~\\}
  \par}
  
  % Abstract Text
  {\setlength\parindent{1.25cm}
  \normalfont\normalsize\singlespacingplus\par
  \input{contents/abstract}}
  
  \clearpage

  % Check if current page is even, insert blank page if needed
  \ifodd\value{page}\relax
    % Odd page, good, do nothing
  \else
    \blankpage
  \fi
}{}

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
  \firstpagegeometry    % first page top = 5cm, others top = 3.75cm
  \pagestyle{plain} % show page numbering
  \thispagestyle{empty} % No page number on first page
  % \addcontentsline{toc}{chapter}{Acknowledgment}
  % \typeout{acknowledgment}

  % Title
  {\centering\singlespacingplus
    {\normalfont\Large\bfseries{Acknowledgment}\\~\\}
  \par}

  % Acknowledgment Content
  \setlength\parindent{1.25cm}
  \normalfont\normalsize\singlespacingplus\par
  \input{contents/acknowledgment}

  % Author Signature Section
  \vspace{54pt} % 3 lines x 12pt x 1.5

  % Name and date centered in an 8cm column at the right
  \noindent
  \begin{tabular}{@{}p{\dimexpr\textwidth-8cm\relax}@{}p{8cm}@{}}
    & \makebox[8cm][c]{\@author} \\
    & \makebox[8cm][c]{{\@examinationday} {\@examinationmonth} {\@examinationyear}}
  \end{tabular}

  \clearpage

  % Check if current page is even, insert blank page if needed
  \ifodd\value{page}\relax
    % Odd page, good, do nothing
  \else
    \blankpage
  \fi
}{}

%% --------------------------------------------------------------------------
%% Appendix Page Formatting
%% --------------------------------------------------------------------------

\let\oldappendix\appendix
\renewcommand{\appendix}{%
  \ifodd\value{page}\relax\else
    \blankpage % inserts a blank page, which doesn't get counted
  \fi
  \clearpage
  \pagestyle{plain} % show page numbering
  \thispagestyle{empty} % no page number on the first page
  % \addcontentsline{toc}{chapter}{#1}%
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

% Layout taken from the VISTEC Word template (bio.docx):
%  - labels in a 2in (5.08cm) column, values wrap under the value column
%  - 1.5 line spacing, 8pt space after each paragraph
%  - "Academic Publication:" on its own line, then a numbered list
%    (number at 0.635cm, text at 1.27cm, number in 10pt)
\newlength{\biolabelwidth}
\setlength{\biolabelwidth}{5.08cm}

% \bioentry{Label:}{Value}   (use an empty label for a second line, e.g. a 2nd degree)
\newcommand{\bioentry}[2]{%
  \par
  \noindent
  \hangindent\biolabelwidth
  \hangafter=1
  \makebox[\biolabelwidth][l]{\textbf{#1}}%
  \ignorespaces#2\par
}

% \begin{biopublications} \biopub{key} ... \end{biopublications}
% Optional argument changes the heading (default: Academic Publication:)
\newenvironment{biopublications}[1][Academic Publication:]{%
  \par\noindent\textbf{#1}\par
  % Justified: every publication fills the same text width
  \let\\\@normalcr
  \@rightskip\z@skip
  \rightskip\z@skip
  \parfillskip\z@ \@plus 1fil\relax
  \hyphenpenalty=50     % allow hyphenation here so word spacing stays even
  \exhyphenpenalty=50
  \begin{enumerate}[
    label={\footnotesize\arabic*.},
    align=left,
    leftmargin=1.27cm,
    labelwidth=0.635cm,
    labelsep=0pt,
    topsep=0pt,
    partopsep=0pt,
    itemsep=8pt,
    parsep=0pt
  ]
}{%
  \end{enumerate}
}

% One numbered publication
\newcommand{\biopub}[1]{\item \fullcite{#1}}

\newenvironment{authorbiography}{
  \clearpage
  \firstpagegeometry    % first page top = 5cm, others top = 3.75cm
  \pagestyle{plain}     % Show page numbering
  \thispagestyle{empty} % No page number on the first page
  \addcontentsline{toc}{chapter}{Author’s Biography}
  \typeout{authorbiography}

  % Author Biography Title
  {\centering
    {\Large\normalfont\bfseries{Author’s Biography}\\[12pt]}
  \par}
  
  % Author's Biography Content (1.5 spacing, 8pt after each paragraph)
  \begingroup
    \normalfont\normalsize\singlespacingplus
    \setlength{\parindent}{0pt}%
    \setlength{\parskip}{8pt}%
    \raggedright          % left-aligned, no hyphenation (as in the Word template)
    \hyphenpenalty=10000
    \exhyphenpenalty=10000
    \input{contents/authorbiography}\par
  \endgroup

  \clearpage

  % Last page of the thesis: the blank back page has no page number
  \ifodd\value{page}\relax
    % Odd page, good, do nothing
  \else
    \emptyblankpage
  \fi
}{}

%% --------------------------------------------------------------------------
%% References Page Formatting
%% --------------------------------------------------------------------------

\DeclareBibliographyCategory{exclude}

\newcommand{\vancouverbib}{
  \clearpage
  \firstpagegeometry    % first page top = 5cm, others top = 3.75cm
  \pagestyle{plain}     % Show page numbering
  \thispagestyle{empty} % No page number on first page of References
  \addcontentsline{toc}{chapter}{References}

  % Title for References
  {\centering
    {\Large\bfseries{References}}
    {\normalsize\\~\\}
  \par}
  
  % Set formatting for the references
  \singlespacingplus\normalsize
  \setlength\bibitemsep{0pt}
  
  % Print the bibliography without an additional heading
  \printbibliography[heading=none, notcategory=exclude]
  \ifodd\value{page}\relax
    % Odd page, good, do nothing
  \else
    \blankpage
  \fi
  \clearpage
}

%% --------------------------------------------------------------------------
%% Table of Contents Page Formatting
%% --------------------------------------------------------------------------

% First page Table of Contents header
\newcommand{\tocheader}{%
  \begin{center}
    {\Large\bfseries \contentsname} \normalsize\\~\\
    {} \hfill Page%
    \vspace{-1em}
  \end{center}
}

% Continuation ToC header
\newcommand{\toccontheader}{%
  \begin{center}
    {\Large\bfseries \contentsname~(Cont.)} \normalsize\\~\\
    {} \hfill Page%
    \vspace{-1em}
  \end{center}
}

% Custom Table of Contents Command
\renewcommand\tableofcontents{%
  \clearpage
  \firstpagegeometry    % first page top = 5cm, others top = 3.75cm
  \pagestyle{plain}     % show page numbering
  \thispagestyle{empty} % no page number on the first page

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
\renewcommand{\l@table}{\vistec@listentry}

% First page List of Tables header
\newcommand{\lotheader}{%
  {\centering\singlespacingplus
    {\Large\bfseries \listtablename}\normalsize\\~\\
  \par}
  \vistec@listcolheader{\tablename}
}

% Continuation List of Tables header
\newcommand{\lotcontheader}{%
  {\centering\singlespacingplus
    {\Large\bfseries \listtablename~(Cont.)}\normalsize\\~\\
  \par}
  \vistec@listcolheader{\tablename}
}

% Custom List of Tables command
\renewcommand\listoftables{%
  \clearpage
  \firstpagegeometry    % first page top = 5cm, others top = 3.75cm
  \pagestyle{plain}     % show page numbering
  \thispagestyle{empty} % no page number on the first page

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
\renewcommand{\l@figure}{\vistec@listentry}

% First page List of Figures header
\newcommand{\lofheader}{%
  {\centering\singlespacingplus
    {\Large\bfseries \listfigurename}\normalsize\\~\\
  \par}
  \vistec@listcolheader{\figurename}
}

% Continuation List of Figures header
\newcommand{\lofcontheader}{%
  {\centering\singlespacingplus
    {\Large\bfseries \listfigurename~(Cont.)}\normalsize\\~\\
  \par}
  \vistec@listcolheader{\figurename}
}

% Custom List of Figures command
\renewcommand\listoffigures{%
  \clearpage
  \firstpagegeometry    % first page top = 5cm, others top = 3.75cm
  \pagestyle{plain}     % show page numbering
  \thispagestyle{empty} % no page number on the first page

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
    \vspace*{16pt}
    {\Large\bfseries \listlistingname} \normalsize\\~\\
    \listingname \hfill Page%
    \vspace{-1em}
  \end{center}
}

% Continuation List of Listings header
\newcommand{\lolcontheader}{%
  \begin{center}
    {\Large\bfseries \listlistingname~(Cont.)} \normalsize\\~\\
    \listingname \hfill Page%
    \vspace{-1em}
  \end{center}
}

% Redefine List of Listings command
\renewcommand{\lstlistoflistings}{%
  \clearpage
  \pagestyle{plain} % show page numbering
  \thispagestyle{empty} % no page number on the first page

  \newgeometry{
    inner=3.75cm, % left on odd pages
    outer=2.5cm,  % right on odd pages
    top=3.75cm,
    bottom=2.5cm,
    twoside % important: activate two-side margins (for books/thesis)
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
    /vspace*{16pt}
    {\Large\bfseries \listalgorithmname} \normalsize\\~\\
    \algorithmname \hfill Page%
    \vspace{-1em}
  \end{center}
}

% Continuation List of Algorithms header
\newcommand{\loacontheader}{%
  \begin{center}
    {\Large\bfseries \listalgorithmname~(Cont.)} \normalsize\\~\\
    \algorithmname \hfill Page%
    \vspace{-1em}
  \end{center}
}

% Redefine List of Algorithms command
\renewcommand\listofalgorithms{%
  \clearpage
  \pagestyle{plain} % show page numbering
  \thispagestyle{empty} % no page number on the first page

  \newgeometry{
    inner=3.75cm, % left on odd pages
    outer=2.5cm,  % right on odd pages
    top=3.75cm,
    bottom=2.5cm,
    twoside % important: activate two-side margins (for books/thesis)
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
  \myindent{0.75cm}
  \makebox[5cm][l]{#1}
  \hangindent=6.1cm
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
  \firstpagegeometry    % first page top = 5cm, others top = 3.75cm
  \pagestyle{plain}     % show page numbering
  \thispagestyle{empty} % no page number on the first page

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