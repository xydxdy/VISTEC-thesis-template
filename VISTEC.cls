%% !TEX encoding = UTF-8 Unicode
%% Compiler: pdfLaTeX
%% Packages: TeX live version 2023
%%----------------------------------------------------------------------------
%% Author: Rattanaphon Chaisaen
%% Email: r.chaisaen@gmail.com
%% version ='1.0'

%% VISTEC Thesis Template © 2024 by Rattanaphon Chaisaen is licensed under CC BY-NC-SA 4.0 
%% ---------------------------------------------------------------------------
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Try to avoid editing this file %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% VISTEC disseration class
\ProvidesClass{VISTEC}

% Options
\DeclareOption{final}{%
    \let\ifdraft\iffalse%
    \let\iffinal\iftrue%
    \PassOptionsToClass{final}{report}%
}

\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{report}%
}

\newif\ifshowframe
\DeclareOption{showframe}{\showframetrue}

\newif\ifshowgrid
\DeclareOption{showgrid}{\showgridtrue}

\newif\ifphd
\DeclareOption{phd}{\phdtrue}

\newif\ifmaster
\DeclareOption{master}{\mastertrue}

\newif\ifmse
\DeclareOption{mse}{\msetrue}

\newif\ifese
\DeclareOption{ese}{\esetrue}

\newif\ifbse
\DeclareOption{bse}{\bsetrue}

\newif\ifist
\DeclareOption{ist}{\isttrue}

% Execute default options
\ExecuteOptions{final}
\ProcessOptions\relax

% Load the report class with 12pt
\LoadClass[12pt]{report}

% PDF Settings
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


%%%%%%%%%%%%%%%%%%%%%%%% Packages %%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc} % Enable UTF-8 encoding

\ifshowframe
    \usepackage[a4paper, showframe]{geometry}
\else
    \usepackage[a4paper]{geometry}
\fi

\ifshowgrid
    \usepackage[grid,
      gridunit=cm,
      gridcolor=blue!40,
      subgridcolor=blue!20
      ]{eso-pic}
\fi

% Font and Typesetting
\usepackage{mathptmx} % Times font for pdfLaTeX
% \usepackage{fontspec} % Uncomment if using XeLaTeX
% \setmainfont{Times New Roman}

% Additional Packages
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

\usepackage[version=4]{mhchem}
\usepackage{chemfig}
\DeclareMathAlphabet{\foo}{OT1}{phv}{m}{n}
\renewcommand*\printatom[1]{\ensuremath{\foo{#1}}}
%%%%%%%%%%%%%%%%%% VISTEC-Vancouver Reference Style %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%      Updated 16-02-2018       %%%%%%%%%%%%%%%%%%%%%
% This template is referenced from Vancouver VISTEC update 16022018.ens
% Link: 
% https://vistec-my.sharepoint.com/personal/daraporn_m_vistec_ac_th/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fdaraporn%5Fm%5Fvistec%5Fac%5Fth%2FDocuments%2FEndNote&ga=1
\usepackage[
    style=vancouver, 
    citestyle=numeric-comp, 
    maxbibnames=6, 
    minbibnames=6, 
    giveninits=true,
    backend=bibtex
]{biblatex}


% Declare field formats for bibliographic elements
\DeclareFieldFormat[article]{title}{#1}
\DeclareFieldFormat[article]{journaltitle}{\mkbibbold{#1}}
\DeclareFieldFormat{title}{\mkbibbold{#1}}
\DeclareFieldFormat{booktitle}{\textnormal{#1}}
\DeclareFieldFormat{pages}{#1}

\renewcommand*{\finentrypunct}{.}

% Custom layout for article
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

% Custom layout for proceeding
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

%% fullcite 
\preto\fullcite{\AtNextCite{\defcounter{maxnames}{99}}}
\preto\fullcite{\AtNextCite{\defcounter{minnames}{6}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Global formatting %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Adjust autoref naming for different levels in English
\addto\extrasenglish{%
    \renewcommand{\chapterautorefname}{Chapter}%
    \renewcommand{\sectionautorefname}{Section}%
    \renewcommand{\subsectionautorefname}{Section}%
}

% Set URL style to match the document font
\urlstyle{same}

%%%%%%%%%%%%%%%%%%%%% font size and spacing %%%%%%%%%%%%%%%%%%%%% 

% Redefine font sizes
\renewcommand\Large{\normalfont\fontsize{16pt}{16pt}}
\renewcommand\large{\normalfont\fontsize{14pt}{14pt}}
\renewcommand\normalsize{\normalfont\fontsize{12pt}{12pt}}
\renewcommand\small{\normalfont\fontsize{11pt}{11pt}}
\renewcommand\footnotesize{\normalfont\fontsize{10pt}{10pt}}
\renewcommand\scriptsize{\normalfont\fontsize{8pt}{8pt}}
\renewcommand\tiny{\normalfont\fontsize{6pt}{6pt}}

% Spacing commands
\newcommand{\realsinglespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1.0}\CS}
\renewcommand{\singlespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1.0}\CS}
\newcommand{\singlespacingplus}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1.5}\CS}
\renewcommand{\doublespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{2.0}\CS}
\newcommand{\realdoublespacing}{%
  \let\CS=\@currsize\renewcommand{\baselinestretch}{2.0}\CS}
  
\newcommand{\normalspacing}{\singlespacingplus}
\newcommand{\footnotespacing}{\singlespacing}
\newcommand{\listspacing}[1]{\singlespacing} % Extra argument is an extensibility hook

% Change spacing dynamically
\newcommand{\changespacing}[2]{%
  \renewcommand{#1}{%
    \let\CS=\@currsize\renewcommand{\baselinestretch}{#2}\CS}%
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

%%%%%%%%%%%%%%%%%%%% Input parameters %%%%%%%%%%%%%%%%%%%% 

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

%%%%%%%%%%%%%%%%%%%%% Conditional Degree and Program Settings %%%%%%%%%%%%%%%%%%%%%

% Degree field conditional settings
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Input Macro Commands %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%%%%%%%%%%%%%%%%%%%% Chapter Heading %%%%%%%%%%%%%%%%%%%%%%%%%

\def\@makechapterhead#1{%
    \clearpage
    \pagestyle{plain}
    \thispagestyle{empty}
    
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

%%%%%%%%%% Page Number Position %%%%%%%%%% 

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
    
%%%%%%%%%%%%%%%%%%%%%% Footnotes %%%%%%%%%%%%%%%%%%%%% 

\renewcommand{\@makefntext}[1]{%
    \parindent 1em%
    \noindent
    \footnotespacing
    \hbox to 5em{\hss\@makefnmark}#1
    \par
}

% Default script ratio adjustments for footnotes
\renewcommand{\defaultscriptratio}{.75}
\renewcommand{\defaultscriptscriptratio}{.6}

%%%%%%%%%%%%%%%%% Page Number Settings %%%%%%%%%%%%%%%%% 

\setlength\footskip{1cm} % Set the distance from the bottom of the text to the page number
\raggedbottom            % Prevent pages from automatically adjusting for full-page alignment

%%%%%%%%%%%%%%% Custom Paragraph Indentation %%%%%%%%%%%%% 

\newcommand\myindent[1]{%
    \noindent
    \setlength{\parindent}{#1}
    \indent
}% Usage example: \myindent{1.75cm}

%%%%%%%%%%%%%%%%%%%%%% Enumerate Settings %%%%%%%%%%%%%%%%%%%%%%   

% Define indentation levels for different nested lists
\def\paritemindent{1.65cm}
\def\subparitemindent{2.8cm}
\def\subsubparitemindent{4cm}
    
% Enumerate list settings
\setlist[enumerate]{
    label={\arabic*)},
    leftmargin=0cm,
    topsep=-6pt,
    itemsep=0pt,
    parsep=0ex,
    partopsep=0pt
}

% Itemize list settings
\setlist[itemize]{
    leftmargin=0cm,
    topsep=-6pt,
    itemsep=0pt,
    parsep=0ex,
    partopsep=0pt
}


%%%%%%%%%%%%%%%% Figure/Table/Code Caption Settings %%%%%%%%%%%%%%%% 

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

% Define custom caption format for listings (ragged left alignment)
\DeclareCaptionFormat{raggedlefthanglst}{%
    \setlength{\columnsep}{\widthof{#1#2}}%
    \begin{varwidth}[t]{\textwidth}%
        \normalsize\singlespacingplus%
        \leftskip\columnsep%
        \parindent -\columnsep%
        \makebox[\columnsep][l]{\bfseries #1}#3%
    \end{varwidth}\par%
}
\captionsetup[lstlisting]{format=raggedlefthanglst}

%%%%%%%%%%%%%%%%%%%% Code Style for Listings (Old) %%%%%%%%%%%%%%%%%%%% 

% Define colors for code elements
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{bgcolor}{rgb}{0.95,0.95,0.95}

% Define custom listing style
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{bgcolor},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{blue},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\scriptsize,
    morekeywords={=},                % Add more keywords if needed
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=t,                    
    keepspaces=true,                 
    numbers=left,                    
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=1,
}

% Apply the defined style to all lstlisting environments
\lstset{style=mystyle}

% Customizing labels and captions for listings
\renewcommand{\lstlistingname}{Algorithm}           % Change 'Listing' to 'Algorithm'
\renewcommand{\lstlistlistingname}{List of \lstlistingname s} % Change 'List of Listings' to 'List of Algorithms'
      
%%%%%%%%%%%%%%%%%%% Section and Paragraph Format %%%%%%%%%%%%%%%%%%%%%%%

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

%----------------------------------------------------------
% Custom Section Formatting
%----------------------------------------------------------

% Custom Section Formatting
\renewcommand\section{
    \parskip 1.5ex
    \leftskip 0pt\@startsection{section}{1}
    {\z@}% indent
    {6pt}% <space before>
    {6pt}% <space after>
    {\large\bfseries}
}

% Custom Subsection Formatting
\renewcommand\subsection{
    \parskip 1.5ex
    \leftskip 0pt\@startsection{subsection}{2}
    {\z@}% indent
    {6pt}% <space before>
    {6pt}% <space after>
    {\normalsize\bfseries}
}

% Custom Subsubsection Formatting
\renewcommand\subsubsection{
   \parskip 1.5ex
    \leftskip 0pt\@startsection{subsubsection}{2}
    {\z@}% indent
    {6pt}% <space before>
    {6pt}% <space after>
    {\normalsize\bfseries}
}

% Custom Paragraph Formatting
\renewcommand\paragraph{%
    \vspace{-6pt}
    \setlength{\parindent}{1.25cm}%
    \setlength{\parskip}{6pt}%
    \par%
}

% Custom Subparagraph Formatting
\renewcommand\subparagraph{%
  \vspace{-6pt}
    \setlength{\parindent}{2.25cm}%
    \setlength{\parskip}{6pt}%
    \par%
}

% Custom Subsubparagraph Formatting
\newcommand\subsubparagraph{%
  \vspace{-6pt}
    \setlength{\parindent}{3.5cm}%
    \setlength{\parskip}{6pt}%
    \par%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Page formatting %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%% Title Page %%%%%%%%%%%%%%%%%%%%%%%%%

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
            \includegraphics[height=2.19cm]{\@logo}
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
    \pagestyle{empty}
}{%
    \clearpage
}

%%%%%%%%%%%%%%%%%%%%% Approval Page %%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\makeapproval}[1]{
    \clearpage
    \hyphenation{technology}
    \hyphenation{international}
    
    \newgeometry{
        left   = 3.75cm,
        right  = 2.5cm,
        top    = 2.5cm, 
        bottom = 2.5cm,
    }
    \pagestyle{empty}
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

%%%%%%%%%%%%%%%%%%%%% Abstract Page %%%%%%%%%%%%%%%%%%%%%%%%%
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


%%%%%%%%%%%%%%%%%%%%% Acknowledgment page %%%%%%%%%%%%%%%%%%%%%%%%%
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


%%%%%%%%%%%%%%%%%%%%% List of Abbreviations Page %%%%%%%%%%%%%%%%%%%%%%%%%

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
  \pagestyle{plain}
  \fancyfoot[c]{\thepage}
  \thispagestyle{plain}

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Appendix Page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\oldappendix\appendix
\renewcommand{\appendix}{%
    \clearpage
    \pagestyle{plain}
    \thispagestyle{empty}
    \oldappendix
    \inappendixtrue
    % Redefine the chapter name printed in headings and ToC
    % \renewcommand{\chaptername}{Appendix}
    
    % Change chapter numbering to letters (A, B, C...)
    \renewcommand{\thechapter}{\Alph{chapter}}
    
    % Change section numbering to A.1, A.2, etc.
    \renewcommand{\thesection}{\thechapter.\arabic{section}}

}


%%%%%%%%%%%%%%%%%%%%% Author Biography Page %%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{authorbiography}{
    \clearpage
    \pagestyle{plain} % Show page numbering
    \addcontentsline{toc}{chapter}{Author’s Biography}
    \typeout{authorbiography}
    
    % Author Biography Title
    \noindent
    \begin{center}
        {\Large\normalfont\bfseries{Author’s Biography}\\~\\}
    \end{center}
    
    % Author Biography Content
    \noindent
    \normalsize
    \input{contents/authorbiography}
    
    \clearpage
}


%%%%%%%%%%%%%%%%%%%%%% Table of Contents %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\ifinappendix
\inappendixfalse


% Custom chapter definition to add to the Table of Contents

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

% Customize ToC formatting for chapters
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

%% Customize ToC formatting for \section entries
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



% First page ToC header
\newcommand{\tocheader}{%
  \begin{center}
    {\Large\bfseries Contents} \normalsize\\~\\
    {} \hfill Page
    \vspace{-1em}
  \end{center}
}

% Continuation ToC header
\newcommand{\toccontheader}{%
  \begin{center}
    {\Large\bfseries Contents (Cont.)} \normalsize\\~\\
    {} \hfill Page
    \vspace{-1em}
  \end{center}
}

% Custom Table of Contents Command
\renewcommand\tableofcontents{%
  \clearpage
  \pagestyle{plain}
  \fancyfoot[c]{\thepage}
  \thispagestyle{plain}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format the List of Tables as the VISTEC Graduate School demands.

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

% Redefine table formatting in the List of Tables
\renewcommand{\l@table}{
    \@dottedtocline{1}{0cm}{1.5cm}
}


% First page List of Tables header
\newcommand{\lotheader}{%
  \begin{center}
    {\Large\bfseries \listtablename} \normalsize\\~\\
    Table \hfill Page
    \vspace{-1em}
  \end{center}
}

% Continuation List of Tables header
\newcommand{\lotcontheader}{%
  \begin{center}
    {\Large\bfseries \listtablename\ (Cont.)} \normalsize\\~\\
    Table \hfill Page
    \vspace{-1em}
  \end{center}
}

% Custom List of Tables command
\renewcommand\listoftables{%
  \clearpage
  \pagestyle{plain}
  \fancyfoot[c]{\thepage}
  \thispagestyle{plain}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format the List of Figures as the VISTEC Graduate School demands.

% Redefine figure formatting in the List of Figures
\renewcommand{\l@figure}{
    \@dottedtocline{1}{0cm}{1.5cm}
}

% First page List of Figures header
\newcommand{\lofheader}{%
  \begin{center}
    {\Large\bfseries \listfigurename} \normalsize\\~\\
    Figure \hfill Page
    \vspace{-1em}
  \end{center}
}

% Continuation List of Figures header
\newcommand{\lofcontheader}{%
  \begin{center}
    {\Large\bfseries \listfigurename\ (Cont.)} \normalsize\\~\\
    Figure \hfill Page
    \vspace{-1em}
  \end{center}
}

% Custom List of Figures command
\renewcommand\listoffigures{%
  \clearpage
  \pagestyle{plain}
  \fancyfoot[c]{\thepage}
  \thispagestyle{plain}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%% Source Code %%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Set the default style for minted code listings
\setminted{%
    fontsize=\small,
    baselinestretch=1,
    linenos=True,
    frame=lines,
    framesep=2mm
}

% Custom Caption Format for Code Listings
\DeclareCaptionFormat{raggedlefthangcode}{%
    \setlength{\columnsep}{\widthof{#1#2}}
    \begin{varwidth}[t]{\textwidth}%
        \normalsize\singlespacingplus
        \leftskip\columnsep
        \parindent -\columnsep
        \makebox[\columnsep][l]{\bfseries #1}#3%
    \end{varwidth}\par%
}

% Apply the custom caption format to listings (Source Code)
\captionsetup[listing]{%
    format=raggedlefthangcode,
    name=Source Code
}

% Rename Listings to Source Code
\renewcommand{\listingname}{Source Code} % Listing -> Source Code
\renewcommand{\listlistingname}{List of \listingname s} % List of Listings -> List of Source Codes


%%%%%%%%%%%%%%%%%%%%%%%%%%%  Algorithm %%%%%%%%%%%%%%%%%%%%%%%%%%% 


% Custom Algorithm Naming and Numbering
\newcommand{\algorithmname}{Algorithm}
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

% Rename the List of Algorithms title
\renewcommand{\listalgorithmname}{List of Algorithms}


%%%%%%%%%%%%%%%%%%%%%% List of Algorithms %%%%%%%%%%%%%%%%%%%%%% 
% Define List of Algorithms based on List of Figures
\let\l@algorithm\l@figure
\let\listofalgorithms\listoffigures

% Modify the list to use "loa" instead of "lof"
\patchcmd{\listofalgorithms}{\@starttoc{lof}}{\@starttoc{loa}}{}{}%

% Adjust how the List of Algorithms is added to the Table of Contents
\patchcmd{\@chapter}{\addtocontents}{%
    \addtocontents{loa}{}%
    \addtocontents}{}{}%=

% Define the formatting for each algorithm in the List of Algorithms
\renewcommand{\l@algorithm}[2]{
    \@dottedtocline{1}{0.25cm}{1.5cm}{#1}{#2}%
}

% First page List of Algorithms header
\newcommand{\loaheader}{%
  \begin{center}
    {\Large\bfseries \listalgorithmname} \normalsize\\~\\
    Algorithm \hfill Page
  \end{center}
}

% Continuation List of Algorithms header
\newcommand{\loacontheader}{%
  \begin{center}
    {\Large\bfseries \listalgorithmname\ (Cont.)} \normalsize\\~\\
    Algorithm \hfill Page
  \end{center}
}

% Redefine List of Algorithms command
\renewcommand{\listofalgorithms}{%
  \clearpage
  \pagestyle{plain}
  \fancyfoot[c]{\thepage}
  \thispagestyle{plain}

  \newgeometry{
    top    = 5cm,
    bottom = 2.5cm,
    left   = 3.75cm,
    right  = 2.5cm,
  }

  % Add List of Algorithms to the Table of Contents
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

    % Start the List of Algorithms
    \@starttoc{loa}%
  \endgroup

  \restoregeometry
  \clearpage
}   

%%%%%%%%%%%%%%%%%%% References page %%%%%%%%%%%%%%%%%%%%
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


\endinput
%% End of file `VISTEC.cls'.