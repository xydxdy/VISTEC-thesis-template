% !TEX encoding = UTF-8 Unicode
% Compiler: pdfLaTeX
% Packages: TeX live version 2023
%----------------------------------------------------------------------------
% Author: Rattanaphon Chaisaen
% Email: r.chaisaen@gmail.com
% Last modified: March 16, 2024
% version ='1.0'

% VISTEC Thesis Template © 2024 by Rattanaphon Chaisaen is licensed under CC BY-NC-SA 4.0 
% ---------------------------------------------------------------------------
      
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
    \renewcommand{\@program}{Information Biomolecular Science and Engineering}
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
        \vspace*{1\baselineskip}
         {\Large\bfseries \@chapapp\space\thechapter} \normalsize\\[2em] 
         {\Large\bfseries#1} 
         \vspace*{1\baselineskip}
    \end{center}%
}
\def\@makeschapterhead#1{%
    \begin{center}%
    \vspace*{1\baselineskip}
        \Large\bfseries #1
        \vspace*{1\baselineskip}
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
    topsep=-2ex,
    itemsep=0ex,
    parsep=0ex,
    partopsep=0pt
}

% Itemize list settings
\setlist[itemize]{
    leftmargin=0cm,
    topsep=-2ex,
    itemsep=0ex,
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
    \setlength{\columnsep}{\widthof{#1} + 2ex}%
    \normalsize\singlespacingplus%
    \leftskip 0cm%
    \hangindent\columnsep%
    \makebox[\columnsep-0.7ex][l]{\bfseries #1}#3%
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

% Removed redundant commented-out caption configurations for clarity
% Uncomment and adjust these lines if further customization of figure or table captions is needed:

% \captionsetup[figure]{
%     labelfont=bf,
%     format=raggedcenter,
%     labelsep=space,
%     singlelinecheck=false,
% }

% \captionsetup[table]{
%     labelfont=bf,
%     format=hang,
%     labelsep=space,
%     justification=justified,
%     singlelinecheck=false,
% }

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

% Uncomment the following lines if further customization for captions is needed
% \captionsetup[lstlisting]{
%     labelfont=bf,
%     format=hang,
%     labelsep=space,
%     justification=justified,
%     singlelinecheck=false,
%     % indention=1.8cm,
% }
              
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

% Custom Section Formatting
\renewcommand\section{
    \parskip 1.5ex
    \leftskip 0pt\@startsection{section}{1}
    {\z@}% indent
    {\baselineskip}% <space before>
    {0.5pt}% <space after>
    {\large\bfseries}
}

% Custom Subsection Formatting
\renewcommand\subsection{
    \parskip 1.5ex
    \leftskip 0pt\@startsection{subsection}{2}
    {\z@}% indent
    {\baselineskip}% <space before>
    {0.5pt}% <space after>
    {\normalsize\bfseries}
    }

% Custom Subsubsection Formatting
\renewcommand\subsubsection{
    \parskip 1.5ex
    \leftskip 0pt\@startsection{subsubsection}{2}
    {\z@}% indent
    {\baselineskip}% <space before>
    {0.5pt}% <space after>
    {\normalsize\bfseries}
}

% Custom Paragraph Formatting
\renewcommand*\paragraph{%
    \vspace{-1ex}%
    \setlength{\parindent}{1.25cm}%
    \setlength{\parskip}{1.5ex}%
}

% Custom Subparagraph Formatting
\renewcommand*\subparagraph{%
    \vspace{-1ex}%
    \setlength{\parindent}{2.25cm}%
    \setlength{\parskip}{1.5ex}%
}

% Custom Subsubparagraph Formatting
\newcommand*\subsubparagraph{%
    \vspace{-1ex}%
    \setlength{\parindent}{3.5cm}%
    \setlength{\parskip}{1.5ex}%
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
            \includegraphics[height=2.18cm]{\@logo}
            \vspace{14pt}
            
            % Title
            \large\normalfont\MakeUppercase{\@title}
        \end{center}
        
        \vfill
        
        % Author Information
        \begin{center}
            \large\normalfont\MakeUppercase{\@author} \\
            ID \@studentid
        \end{center}
        
        \vfill
        
        % Thesis Information
        \begin{center}
            \large\normalfont
            A THESIS SUBMITTED TO \\
            \MakeUppercase{\@institute} \\
            IN PARTIAL FULFILLMENT OF THE REQUIREMENTS FOR \\
            THE DEGREE OF \MakeUppercase{\@degreefield} \\
            IN \MakeUppercase{\@program} \\
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
    \begin{tabular}{p{0.1725\linewidth}p{0.7825\linewidth}}
        \\~\\ % two line spaces
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
            \ifthenelse{\equal\tmptwo\memtwo}{& \\[-1em]}{
                & \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@membertwo) \end{tabular} \\~\\
            }

            \ifthenelse{\equal\tmpthree\memthree}{}{
                \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@memberthree) \end{tabular}
            }
            \ifthenelse{\equal\tmpfour\memfour}{& \\[-1em]}{
                & \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@memberfour) \end{tabular} \\~\\
            }

            \ifthenelse{\equal\tmpfive\memfive}{}{
                \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@memberfive) \end{tabular}
            }
            \ifthenelse{\equal\tmpsix\memsix}{& \\[-1em]}{
                & \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@membersix) \end{tabular} \\~\\
            }

            \ifthenelse{\equal\tmpseven\memseven}{}{
                \begin{tabular}[c]{@{}l@{}} ................................................ Member \\ (\@memberseven) \end{tabular}
            }
            \ifthenelse{\equal\tmpeight\memeight}{& \\[-1em]}{
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
                \begin{tabular}[c]{@{}c@{}} \\[3em] ............................................................... \\ (\@gradcommittee) \\ Chairperson \\ Graduate Studies Committee \end{tabular}
            }
            & \multicolumn{1}{l}{}
        \end{tabular}
    \end{table}

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
        {\Large\normalfont{\@title}} \normalsize\\[2em]
        {\Large\normalfont{\bfseries{Abstract}}} \normalsize\\[2em]
        \normalsize\normalfont{\@author} \normalsize\\[2em]
    \end{center}
    
    % Abstract Text
    \setlength\parindent{1.75cm}
    \normalfont\normalsize\par
    \input{contents/abstract}
    
    \clearpage
}

% Keywords Environment
\newenvironment{keywords}[1]{
    \vfill
    \noindent\hangindent=4.7em 
    Keywords: #1.
}

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
        {\normalfont\Large{\bfseries{Acknowledgment}}} \\[2em]
    \end{center}

    % Acknowledgment Content
    \setlength\parindent{1.25cm}
    \normalfont\normalsize\par
    \input{contents/acknowledgment}

    % Author Signature Section
    \vspace{24pt}
    \parbox{0.7\textwidth}{}\hfill
    \parbox{0.3\textwidth}{
        \begin{center}
                \@author \\  
                {\@examinationday} {\@examinationmonth} {\@examinationyear} 
        \end{center}
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

% Header for Abbreviations Page
\newcommand{\abbreviationheader}{
    \vspace*{-3cm}
    \begin{center}%
        {\normalfont\Large{\bfseries{List of Abbreviations}}}\\[2em]
    \end{center}
}

% Abbreviations Environment
\newenvironment{abbreviations}{%
    \clearpage
    \pagestyle{plain}
    \thispagestyle{firstpage} % do not show header footer this page
    \newgeometry{
        left   = 3.75cm,
        right  = 2.5cm,
        top    = 6.8cm, 
        bottom = 2.5cm,
    }
    
    \addcontentsline{toc}{chapter}{List of Abbreviations}

    % Custom Header for Continued Pages
    \fancyhf[ch]{
        \vspace*{-0.8cm}
        \begin{center}%
            \normalfont\Large{\bfseries{List of Abbreviations (Cont.)}}
        \end{center}
    }
    % Abbreviations Header
    \abbreviationheader
    
    % Input the Abbreviations Content
    \input{contents/abbreviations}

    % Restore Original Geometry
    \restoregeometry
    \clearpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Appendix Page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\oldappendix\appendix
\renewcommand{\appendix}{%
    \clearpage
    \pagestyle{plain} % Set page style to plain for the appendix
    \thispagestyle{empty} % Remove header/footer from the first page of the appendix
    \oldappendix

    % Customize Appendix Sections and Numbering
    \renewcommand{\thesection}{\Alph{section}}
    
    % Update Table of Contents Label for Appendix Sections
    \addtocontents{toc}{\protect\renewcommand{\protect\chaptername}{Appendix}}
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
        \Large\normalfont\bfseries{Author’s Biography} \normalsize\\[2em]
    \end{center}
    
    % Author Biography Content
    \noindent
    \normalsize
    \input{contents/authorbiography}
    
    \clearpage
}


%%%%%%%%%%%%%%%%%%%%%% Table of Contents %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Custom chapter definition to add to the Table of Contents
\def\@chapter[#1]#2{
    \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}%
        \addcontentsline{toc}{chapter}%
        {\noindent\makebox[\widthof{\@chapapp{ x}{\thechapter}}][l]{\protect\@chapapp{ }\thechapter}\hskip 0em #1}
    \else
        \addcontentsline{toc}{chapter}{#1}%
    \fi
    \chaptermark{#1}%
    \@makechapterhead{#2}%
    \@afterheading
}%

% Customize ToC formatting for chapters
\renewcommand*\l@chapter[2]{%
\ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \hangindent=1cm
    \setlength\@tempdima{2em}%
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

% Customize ToC formatting for sections
\renewcommand*\l@section[2]{%
\ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \hskip 0.57cm \@plus\p@ \hangindent=1.85cm
    \setlength\@tempdima{2em}%
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

% Customize ToC formatting for subsections
\renewcommand*\l@subsection[2]{%
\ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \hskip 1.4cm \@plus\p@ \hangindent=2.7cm
    \setlength\@tempdima{2.5em}%
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

% Header for the Table of Contents
\newcommand{\tocheader}{{%
\vspace*{-3.7cm}
\begin{center}%
    {\Large\bfseries{Contents}} \\[2em]
    {} \hfill {Page}\par
\end{center}
\vspace*{-1em}
}}

% Custom Table of Contents Command
\renewcommand\tableofcontents{%
    \clearpage
    \pagestyle{plain}
    \fancyfoot[c]{\thepage}
    \thispagestyle{firstpage}
    \newgeometry{
        left   = 3.75cm,
        right  = 2.5cm,
        top    = 7.5cm,
        bottom = 2.5cm,
    }

    % Header for Continuation Pages of the Table of Contents
    \fancyhf[ch]{
        \vspace*{-1.5cm}
        \begin{center}%
            {\Large\bfseries{Contents (Cont.)}} \\[1.2cm]
            {} \hfill {Page}\par
            \vspace*{-1em}
        \end{center}
    }
    
    % Main ToC Header
    \tocheader
    
    % Generate the Table of Contents
    \begingroup
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


% Header for the List of Tables
\newcommand{\totheader}{
    \vspace*{-3.7cm}
    \begin{center}%
        {\Large\bfseries{\listtablename}} \\[2em]
        {Table}\hfill{Page}\par
    \end{center}
    \vspace*{-1em}
}

% Custom List of Tables Command
\renewcommand\listoftables{%
    \clearpage
    \pagestyle{plain}
    \thispagestyle{firstpage} % No header/footer on the first page
    \newgeometry{
        left = 3.75cm,
        right = 2.5cm,
        top = 7.5cm,
        bottom = 2.5cm,
    }

    % Add List of Tables to the Table of Contents
    \addcontentsline{toc}{chapter}{\listtablename}
    \fancyhf[ch]{
        \vspace*{-1.5cm}
        \begin{center}%
            {\Large\bfseries{\listtablename{ (Cont.)}}} \\[1.2cm]
            {Table}\hfill{Page}\par
        \end{center}
        \vspace*{-1em}
    }
        
    % List of Tables Header
    \totheader

    % Generate the List of Tables
    \begingroup
        \@starttoc{lot}
    \endgroup

    % Restore original geometry after List of Tables
    \restoregeometry
    \clearpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format the List of Figures as the VISTEC Graduate School demands.

% Redefine figure formatting in the List of Figures
\renewcommand{\l@figure}{
    \@dottedtocline{1}{0cm}{1.5cm}
}

% Header for the List of Figures
\newcommand{\tofheader}{%
    \vspace*{-3.7cm}
    \begin{center}%
        {\Large\bfseries{\listfigurename}}\\[2em]
        {Figure}\hfill{Page}\par
    \end{center}
    \vspace*{-1em}
}

\renewcommand\listoffigures{%
    \clearpage
    \pagestyle{plain}
    \thispagestyle{firstpage} % No header/footer on the first page
    \newgeometry{
        left   = 3.75cm,
        right  = 2.5cm,
        top    = 7.5cm,
        bottom = 2.5cm,
    }

    % Add List of Figures to the Table of Contents
    \addcontentsline{toc}{chapter}{\listfigurename}

    % Header for Continuation Pages
    \fancyhf[ch]{
        \vspace*{-1.5cm}
        \begin{center}%
            {\Large\bfseries{\listfigurename{ (Cont.)}}}\\[1.2cm]
            {Figure}\hfill{Page}\par
        \end{center}
        \vspace*{-1em}
    }
     % List of Figures Header
    \tofheader

    % Generate the List of Figures
    \begingroup
        \renewcommand\addvspace[1]{} % Remove extra vertical space between entries
        \@starttoc{lof}
    \endgroup

    % Restore original page geometry after List of Figures
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

% Header for the List of Algorithms
\newcommand{\toaheader}{{%
    \begin{center}%
    \vspace*{-2.45cm}
        {\Large\bfseries{\listalgorithmname} \normalsize\\[1em]}
        {Algorithm} \hfill {\hfill{Page}}
        \vspace{-1em}
    \end{center}
  }}

% Redefine List of Algorithms command
\let\oldlistofalgorithms\listofalgorithms
\renewcommand{\listofalgorithms}{
    \clearpage
    \thispagestyle{firstpage}
    \newgeometry{
        left = 3.75cm,
        right = 2.5cm,
        top = 6.85cm,
        bottom = 2.5cm,
    }
    
    % Remove dotted leaders for continuation pages
    \renewcommand\@dotsep{10000}

    % Add List of Algorithms to the Table of Contents
    \addcontentsline{toc}{chapter}{\listalgorithmname}

    % Header for Continuation Pages of the List of Algorithms
    \fancyhf[ch]{
    \vspace*{-0.95cm}
        \begin{center}%
            {\Large\bfseries{\listalgorithmname{ }(Cont.)} \normalsize\\[1em]}
            {Algorithm} \hfill{Page}
        \end{center}
    }
    % Add the Main Header for List of Algorithms
    \toaheader

    % Start the Table of Algorithms
    \begingroup
        \@starttoc{loa}
    \endgroup

    % Restore original page layout
    \restoregeometry
    \clearpage
}   

%%%%%%%%%%%%%%%%%%% References page %%%%%%%%%%%%%%%%%%%%

\newcommand{\vancouverbib}{
    \clearpage
    \addcontentsline{toc}{chapter}{References}

     % Title for References
    \begin{center}%
        {\Large\bfseries{References}}
        \normalsize\\[2em]
    \end{center}
    
    % Set formatting for the references
    \singlespacingplus\normalsize
    \setlength\bibitemsep{0pt}
    
    % Print the bibliography without an additional heading
    \printbibliography[heading=none]
    
    \clearpage
}


\endinput
%% End of file `VISTEC.cls'.
