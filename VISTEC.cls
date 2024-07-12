% !TEX encoding = UTF-8 Unicode
% Compiler: pdfLaTeX
% Packages: TeX live version 2023
%----------------------------------------------------------------------------
% Author: Rattanaphon Chaisaen
% Email: r.chaisaen@gmail.com
% Last modified: June 18, 2024
% version ='0.0.1'
% ---------------------------------------------------------------------------
      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Try to avoid editing this file %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% VISTEC disseration class
\ProvidesClass{VISTEC}

% \newif\ifthesis
% \DeclareOption{thesis}{\thesistrue}

\DeclareOption{final}{%
    \let\ifdraft\iffalse%
    \let\iffinal\iftrue%
    \PassOptionsToClass{final}{report}%
}

\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{report}%
}

\newif\ifshowframe
\DeclareOption{showframe}{\showframetrue }

\newif\ifshowgrid
\DeclareOption{showgrid}{\showgridtrue }


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

% \ExecuteOptions{thesis}
\ExecuteOptions{final}
% \ExecuteOptions{phd}
% \ExecuteOptions{ist}
\ProcessOptions\relax

\LoadClass[12pt]{report}

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



%%%%%%%%%%%%%%%%%%%%%%%% usepackage %%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc} % Enable UTF-8 encoding


\ifshowframe
% % comment to remove showframe
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

%%%%%%%%%%%%%%%%%%%%%%%% font %%%%%%%%%%%%%%%%%%%%%%%%

%%%%  pdfLaTeX: pdfLaTeX
\usepackage{mathptmx} % font=Times --> https://www.overleaf.com/learn/latex/font_typefaces
% \usepackage[letterspace=-500]{microtype} % space of dot in table of content

%%%%  pdfLaTeX: XeLaTeX
% \usepackage{fontspec}
% \setmainfont{Times New Roman}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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
\usepackage{mfirstuc}
\usepackage{longtable}
\usepackage{microtype}

\usepackage[style=vancouver, 
            citestyle=numeric-comp, 
            maxbibnames=6, 
            minbibnames=6, 
            backend=bibtex]{biblatex}

\addto\extrasenglish{%
  \renewcommand{\chapterautorefname}{Chapter}%
}
\addto\extrasenglish{%
  \renewcommand{\subsectionautorefname}{Section}%
}
\addto\extrasenglish{%
  \renewcommand{\subsectionautorefname}{Section}%
}

\urlstyle{same}

% \usepackage[skip=0pt plus1pt, indent=1.3cm]{parskip}
%%%%%%%%%%%%%%%%%%%%% font size and spacing %%%%%%%%%%%%%%%%%%%%% 

\renewcommand\Large{\normalfont\fontsize{16pt}{16pt}}
\renewcommand\large{\normalfont\fontsize{14pt}{14pt}}
\renewcommand\normalsize{\normalfont\fontsize{12pt}{12pt}}
\renewcommand\small{\normalfont\fontsize{11pt}{11pt}}
\renewcommand\footnotesize{\normalfont\fontsize{10pt}{10pt}}
\renewcommand\scriptsize{\normalfont\fontsize{8pt}{8pt}}
\renewcommand\tiny{\normalfont\fontsize{6pt}{6pt}}

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
\newcommand{\listspacing}[1]{\singlespacing} % extra arg is extensibility hook
\newcommand{\changespacing}[2]{%
  \renewcommand{#1}{%
    \let\CS=\@currsize\renewcommand{\baselinestretch}{#2}\CS}%
}

\newcommand{\changenormalspacing}[1]{\renewcommand{\normalspacing}{#1}}
\normalspacing

\def\@floatboxreset {%
    \reset@font
    \normalsize
    \singlespacing
    \@setminipage
}


%%%%%%%%%%%%%%%%%%%% Input parameters %%%%%%%%%%%%%%%%%%%% 

\newcommand{\@titlesize}{\Large}
\newcommand{\@subtitlesize}{\large}
\newcommand{\@authortitle}{\normalsize} % No Pharaoh he.
\newcommand{\@authorsize}{\normalsize} % No Pharaoh he.
\newcommand{\@studentid}{1888888} % No Pharaoh he.
\newcommand{\@program}{<<The program>>} % No Pharaoh he.
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%% if declare options %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifphd\renewcommand{\@degreefield}{Doctor of Philosophy}\fi
\ifmaster\renewcommand{\@degreefield}{Master of Engineering}\fi

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% input macro %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

    % \vspace*{1\baselineskip}
    \begin{center}%
        \vspace*{1\baselineskip}
         {\Large\bfseries \@chapapp\space\thechapter} \normalsize\\[2em] 
         {\Large\bfseries#1} 
         \vspace*{1\baselineskip}
    \end{center}%
    % \vspace*{1\baselineskip}
}
\def\@makeschapterhead#1{%
    % \vspace*{1\baselineskip}
    \begin{center}%
    \vspace*{1\baselineskip}
        \Large\bfseries #1
        \vspace*{1\baselineskip}
    \end{center}%
    % \vspace*{1\baselineskip}
}


%%%%%%%%%%  page number position %%%%%%%%%% 

\fancypagestyle{plain}{% For Chapter, do not show number on first page
    % \fancyhf{} % clear all header and footer fields
    % \fancyfoot[C]{\normalsize\thepage}
    % \renewcommand{\headrulewidth}{0pt}
    % \renewcommand{\footrulewidth}{0pt}
    \fancyhf{}% Clear header/footer
    \fancyfoot[C]{\thepage}%
    \renewcommand{\headrulewidth}{0pt}%
} % except the center

\fancypagestyle{firstpage}{% show number on first page
  \fancyhf{}%
  \renewcommand{\footrulewidth}{0mm}%
  \fancyfoot[C]{\normalsize\thepage}%
  \renewcommand{\headrulewidth}{0mm}%
} 
    
%%%%%%%%%%%%%%%%%%%%%%  footnotes %%%%%%%%%%%%%%%%%%%%% 
\renewcommand{\@makefntext}[1]{%
    \parindent 1em%
    \noindent
    \footnotespacing
    \hbox to 5em{\hss\@makefnmark}#1
    \par
}
\renewcommand{\defaultscriptratio}{.75}
\renewcommand{\defaultscriptscriptratio}{.6}

%%%%%%%%%%%%%%%%% page number %%%%%%%%%%%%%%%%%
\setlength\footskip{1cm}
\raggedbottom

%%%%%%%%%%%%%%%  my indent par %%%%%%%%%%%%%%
\newcommand\myindent[1]{
    \noindent
    \setlength{\parindent}{#1}
    \indent
    % \hspace{\parindent}
}% \myindent{1.75cm}

%%%%%%%%%%%%%%%%%%%%%%   enumerate   %%%%%%%%%%%%%%%%%%%%%%   
\def\paritemindent{1.65cm}
\def\subparitemindent{2.8cm}
\def\subsubparitemindent{4cm}

\setlist[enumerate]{label={\arabic*)},
                    leftmargin=0cm, 
                    topsep=-2ex, 
                    itemsep=0ex, 
                    parsep=0ex,
                    partopsep=0pt
}
\setlist[itemize]{leftmargin=0cm, 
                topsep=-2ex, 
                itemsep=0ex, 
                parsep=0ex,
                partopsep=0pt
}

%%%%%%%%%%%%%%% Figure/Table caption %%%%%%%%%%%%%%%%%%


% \DeclareCaptionFormat{raggedcenterfig}{%
%     \begin{varwidth}[t]{\textwidth}%
%         \normalsize\singlespacingplus\leftskip 2cm\parindent -2cm\textbf{#1 }#3%
%     \end{varwidth}\par%
% }

\newcommand{\longcaption}[2][]{\caption[#1]{#1 #2}}

\DeclareCaptionFormat{raggedcenterfig}{%
    \setlength{\columnsep}{\widthof{#1#2}}
    \begin{varwidth}[t]{\textwidth}%
        \normalsize\singlespacingplus\leftskip\columnsep\parindent -\columnsep\makebox[\columnsep][l]{\bfseries #1}#3%
    \end{varwidth}\par%
}
\captionsetup[figure]{format=raggedcenterfig}%


\DeclareCaptionFormat{raggedlefthangtable}{%
    \setlength{\columnsep}{\widthof{#1} + 2ex}
    \normalsize\singlespacingplus\leftskip 0cm\hangindent\columnsep\makebox[\columnsep-0.7ex][l]{\bfseries #1}#3%
    \par
}

\captionsetup[table]{format=raggedlefthangtable}%


\DeclareCaptionFormat{raggedlefthanglst}{%
    \setlength{\columnsep}{\widthof{#1#2}}
    \begin{varwidth}[t]{\textwidth}%
        \normalsize\singlespacingplus\leftskip\columnsep\parindent -\columnsep\makebox[\columnsep][l]{\bfseries #1}#3%
    \end{varwidth}\par%
}
\captionsetup[lstlisting]{format=raggedlefthanglst}
% \captionsetup[figure]{labelfont=bf,
%                      format=raggedcenter,
%                      labelsep=space,
%                      singlelinecheck=false,
%                     %  indention=1.8cm,
% }
% \captionsetup[table]{labelfont=bf,
%                      format=hang,
%                      labelsep=space,
%                      justification=justified,
%                      singlelinecheck=false,
%                      %indention=1.8cm,
% }

  
%%%%%%%%%%%%%%%%%% old code style %%%%%%%%%%%%%%%%%%

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{bgcolor}{rgb}{0.95,0.95,0.95}
% https://www.overleaf.com/learn/latex/Code_listing
\lstdefinestyle{mystyle}{
    backgroundcolor=\color{bgcolor},   
    commentstyle=\color{codegreen},
    keywordstyle=\color{blue},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\scriptsize,
    morekeywords={=},            % if you want to add more keywords to the set
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
\lstset{style=mystyle}                    
\renewcommand{\lstlistingname}{Algorithm}% Listing -> Algorithm
\renewcommand{\lstlistlistingname}{List of \lstlistingname s}% List of Listings -> List of Algorithms
% \captionsetup[lstlisting]{labelfont=bf,
%                      format=hang,
%                      labelsep=space,
%                      justification=justified,
%                      singlelinecheck=false,
%                      %indention=1.8cm,
% }
                     

%%%%%%%%%%%%%%%%%%% Section and paragraph format %%%%%%%%%%%%%%%%%%%%%%%

\def\@hangfrom#1{\setbox\@tempboxa\hbox{{#1}}%
    \hangindent 0pt%\wd\@tempboxa
    \noindent\box\@tempboxa
}
     
\newlength{\firstsectionindent}
\setlength{\firstsectionindent}{1.25cm}

\newlength{\secondsectionindent}
\setlength{\secondsectionindent}{2.25cm}

\newlength{\thirdsectionindent}
\setlength{\thirdsectionindent}{3.5cm}

\DeclareRobustCommand{\@seccntformat}[1]{%
    \def\temp@@a{#1}%
    \def\temp@@b{section}%
    \def\temp@@c{subsection}%
    \ifx\temp@@a\temp@@b
        \noindent\makebox[\firstsectionindent][l]{\csname the#1\endcsname}\hfil
    % \csname the#1\endcsname
    \else
        \ifx\temp@@a\temp@@c
            \noindent\makebox[\secondsectionindent][r]{\csname the#1\endcsname\hskip 0.4em}\hfil
        \else
            \noindent\makebox[\thirdsectionindent][r]{\csname the#1\endcsname\hskip 0.3em}\hfil
        \fi
    \fi
} % space between section number and text


\renewcommand\section{
    \parskip 1.5ex
    \leftskip 0pt\@startsection{section}{1}
    {\z@}% indent
    {\baselineskip}% <space before>
    {0.5pt}% <space after>
    {\large\bfseries}
}
                                  
\renewcommand\subsection{
    \parskip 1.5ex
    \leftskip 0pt\@startsection{subsection}{2}
    {\z@}% indent
    {\baselineskip}% <space before>
    {0.5pt}% <space after>
    {\normalsize\bfseries}
    }
\renewcommand\subsubsection{
    \parskip 1.5ex
    \leftskip 0pt\@startsection{subsubsection}{2}
    {\z@}% indent
    {\baselineskip}% <space before>
    {0.5pt}% <space after>
    {\normalsize\bfseries}
}

\renewcommand*\paragraph{
    \vspace{-1ex}
    \setlength{\parindent}{1.25cm}
    \setlength{\parskip}{1.5ex}
} %1.25cm
\renewcommand*\subparagraph{
    \vspace{-1ex}
    \setlength{\parindent}{2.25cm}
    \setlength{\parskip}{1.5ex}

} %2.25cm
\newcommand*\subsubparagraph{
    \vspace{-1ex}
    \setlength{\parindent}{3.5cm}
    \setlength{\parskip}{1.5ex}
} %3.5cm


%%%%%%%%%%%%%%%%%%%%% Title page %%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
    \newgeometry{
            left   = 3.75cm,
      	right  = 2.5cm,
      	top    = 2.5cm,
      	bottom = 2.5cm,
  }
  \begin{titlepage}
    \begin{center}
        \begin{figure}
            \centering
            % \includegraphics[width=5.46cm, height=2.18cm]
            \includegraphics[height=2.18cm]{\@logo}
        \vspace{14pt}
        \end{figure}
        \large\normalfont\MakeUppercase{\@title}
    \end{center}
    \vfill
    \begin{center}
        % \vfill
        % \vfill
        \large\normalfont\MakeUppercase{\@author} \\
        ID \@studentid
        % \vfill
    \end{center}
    \vfill
    \begin{center}
        % \vfill
        \large\normalfont
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

\renewenvironment{titlepage}{%
    \typeout{Title page}
    \pagestyle{empty}
}{%
    \clearpage
}

%%%%%%%%%%%%%%%%%%%%% Approval page BEGIN %%%%%%%%%%%%%%%%%%%%%%%%%
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
    \noindent
    \begin{tabular}{p{0.1725\linewidth}p{0.7825\linewidth}}
        \\~\\ % two line spaces
        \leftskip-0.1in Title: & \@title \\
        \leftskip-0.1in Advisor: & \@advisor \\
        \leftskip-0.1in Name: & \@authortitle \ \@author \\
        \leftskip-0.1in Program: & {\@degreefield} Program in {\@program} (International Program) \\
    \end{tabular} \\[1ex]
    % Examination Date \@examinationdate \\
    Examination Date {\@examinationday} {\@examinationmonth} {\@examinationyear} \\
    \rule{\linewidth}{0.5pt}
    \\[1ex]
    {\@institute} approved this thesis as a partial fulfillment of the requirements for the degree of {\@degreefield} in {\@program}.

    \vskip 1\baselineskip


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
    
    \par\noindent Examination Committee:
    
    \vskip 1\baselineskip
    \noindent

    \begin{table}[h]
    \centering
    \singlespacingplus
    % \resizebox{\textwidth}{!}{%
    \begin{tabular}{p{0.5\linewidth}p{0.5\linewidth}}%{ll}
    \ifthenelse{\equal\tmpone\memone}{}{\begin{tabular}[c]{@{}l@{}}.......................................... Chairperson  \\ (\@memberone)\end{tabular}}
    \ifthenelse{\equal\tmptwo\memtwo}{& \\[-1em]}{ & \begin{tabular}[c]{@{}l@{}}................................................ Member \\ (\@membertwo)\end{tabular}\\~\\ }
    
    \ifthenelse{\equal\tmpthree\memthree}{}{\begin{tabular}[c]{@{}l@{}}................................................ Member \\ (\@memberthree)\end{tabular}}
    \ifthenelse{\equal\tmpfour\memfour}{& \\[-1em]}{ & \begin{tabular}[c]{@{}l@{}}................................................ Member \\ (\@memberfour)\end{tabular} \\~\\ }
    
    \ifthenelse{\equal\tmpfive\memfive}{}{\begin{tabular}[c]{@{}l@{}}................................................ Member \\ (\@memberfive)\end{tabular}}
    \ifthenelse{\equal\tmpsix\memsix}{& \\[-1em]}{ & \begin{tabular}[c]{@{}l@{}}................................................ Member \\ (\@membersix)\end{tabular} \\~\\ }
    
    \ifthenelse{\equal\tmpseven\memseven}{}{\begin{tabular}[c]{@{}l@{}}................................................ Member \\ (\@memberseven)\end{tabular}}
    \ifthenelse{\equal\tmpeight\memeight}{& \\[-1em]}{ & \begin{tabular}[c]{@{}l@{}}................................................ Member \\ (\@membereight)\end{tabular} \\~\\ }
    
    % \multicolumn{1}{l}{\begin{tabular}[c]{@{}c@{}} \\[3em] ...............................................................\\ (\@gradcommittee)\\ Chairperson\\ Graduate Studies Committee\end{tabular}} 
    % & \multicolumn{1}{l}{}                                                           
    \end{tabular}%
    % }
    \end{table}

    \vfill

    \begin{table}[h]
    % \centering
    \singlespacingplus
    % \resizebox{\textwidth}{!}{%
    \begin{tabular}{p{0.5\linewidth}p{0.5\linewidth}}%{ll}
    \multicolumn{1}{l}{\begin{tabular}[c]{@{}c@{}} \\[3em] ...............................................................\\ (\@gradcommittee)\\ Chairperson\\ Graduate Studies Committee\end{tabular}} 
    & \multicolumn{1}{l}{}                                                           
    \end{tabular}%
    % }
    \end{table}

    \clearpage
}


%%%%%%%%%%%%%%%%%%%%% Abstract page BEGIN %%%%%%%%%%%%%%%%%%%%%%%%%
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
 
    \begin{center}
        {\Large\normalfont{\@title}} \normalsize\\[2em]
        {\Large\normalfont{\bfseries{Abstract}}} \normalsize\\[2em]
        % \normalsize\normalfont\MakeUppercase{\@author} \\
        \normalsize\normalfont{\@author} \normalsize\\[2em]
    \end{center}
    \setlength\parindent{1.75cm}
    \normalfont\normalsize\par
    \input{contents/abstract}
    \clearpage
}

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

    \begin{center}%
        {\normalfont\Large{\bfseries{Acknowledgment}}} \\[2em]
    \end{center}
    \setlength\parindent{1.25cm}
    \normalfont\normalsize\par
    \input{contents/acknowledgment}

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


%%%%%%%%%%%%%%%%%%%%% List of Abbreviations page %%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{newabbr}[2]{
    % \myindent{0.75cm}\makebox[6.6cm][l]{#1}\hangindent=7.45cm #2\par
    \myindent{0.425cm}\makebox[7.05cm][l]{#1}\hangindent=7.625cm \capitalisewords{#2}\par
}

\newcommand{\abbreviationheader}{
    \vspace*{-3cm}
    \begin{center}%
        {\normalfont\Large{\bfseries{List of Abbreviations}}}\\[2em]
    \end{center}
}

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
    % \typeout{abbreviations}
    \fancyhf[ch]{
        \vspace*{-0.8cm}
        \begin{center}%
            \normalfont\Large{\bfseries{List of Abbreviations (Cont.)}}
        \end{center}
    }
    \abbreviationheader
    \input{contents/abbreviations}
    \restoregeometry
    \clearpage
}

% \newcommand{\abbreviationscont}{
%     \newpage
%     \clearpage
%     \thispagestyle{empty}
%     \newgeometry{
%               left   = 3.75cm,
%           	right  = 2.5cm,
%           	top    = 5cm, 
%           	bottom = 2.5cm,
%         }
%     \begin{center}%
%           \normalfont\Large{\bfseries{List of Abbreviations (Cont.)}}
%           \normalfont\normalsize\\~\\
%     \end{center}
    
%     \noindent\normalsize
% }{
%     \clearpage
% }


 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Appendix  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\let\oldappendix\appendix
\renewcommand{\appendix}{%
    \clearpage
    \pagestyle{plain}
    \thispagestyle{empty}
    \oldappendix
    
    % \counterwithin{figure}{section}
    % \counterwithin{table}{section}
    % \counterwithin{algorithm}{section}
    % \counterwithin{listing}{section}

    \renewcommand{\thesection}{\Alph{section}}%
    \addtocontents{toc}
    {\protect\renewcommand{\protect\chaptername}{Appendix}}

}

% \renewcommand{\appendix}{%
%     \addcontentsline{toc}{chapter}{Appendix}% Print Appendix in ToC
%     \setcounter{section}{0}% Reset numbering for sections
%     \renewcommand{\thesection}{\Alph{section}}% Adjust section printing (from here onward)
% }


%%%%%%%%%%%%%%%%%%%%% authorbiography page %%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{authorbiography}{
    \clearpage
    \pagestyle{plain}
    \addcontentsline{toc}{chapter}{Author’s Biography}
    \noindent
    \typeout{authorbiography}
    \begin{center}
        \Large\normalfont\bfseries{Author’s Biography} \normalsize\\[2em]
    \end{center}
    \noindent
    \normalsize
    \input{contents/authorbiography}
    \clearpage
}


%%%%%%%%%%%%%%%%%%%%%% Table of Contents %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This command formats entries for Chapters in the Table of Contents.
% The VISTEC Graduate School does not want these lines in boldface, so I
% commented out "\bfseries" in line 9.

\def\@chapter[#1]#2{
    \ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}%
        % \typeout{\@chapapp\space\thechapter}%
        \addcontentsline{toc}{chapter}%
        {\noindent\makebox[\widthof{\@chapapp{ x}{\thechapter}}][l]{\protect\@chapapp{ }\thechapter}\hskip 0em #1}
        % {\noindent\makebox[2.2cm][l]{\protect\@chapapp{ }\thechapter}\hskip 0em #1}% chapter name 2.2 cm indent from paper
    \else
        \addcontentsline{toc}{chapter}{#1}%
    \fi
    \chaptermark{#1}%
    % \addtocontents{lof}{\protect\addvspace{10\p@}}%
    % \addtocontents{lot}{\protect\addvspace{10\p@}}%
    %\if@twocolumn
    %    \@topnewpage[\@makechapterhead{#2}]%
    %\else
    \@makechapterhead{#2}%
    \@afterheading
    %\fi
}%
                    
\renewcommand*\l@chapter[2]{%
\ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    % \vskip 0.3em \@plus\p@
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
        % These three lines cause a line of dots after each TOC entry:
        #1\nobreak
        \leaders\hbox{.}
        % \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{\textls{.}}\mkern \@dotsep mu$}
        \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \penalty\@highpenalty
    \endgroup
\fi}

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
        % These three lines cause a line of dots after each TOC entry:
        #1\nobreak
        \leaders\hbox{.}
        \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \penalty\@highpenalty
        
    \endgroup
\fi}
  
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
        % These three lines cause a line of dots after each TOC entry:
        #1\nobreak
        \leaders\hbox{.}
        % \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{\textls{.}}\mkern \@dotsep mu$}
        \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \penalty\@highpenalty
    \endgroup
\fi}
% \renewcommand*\l@subsection{\@dottedtocline{1}{5.5em}{15em}}

                    
% Format the Table of Contents as the VISTEC Graduate School demands.
% Contents (Cont.): https://tex.stackexchange.com/questions/236729/how-to-add-a-custom-header-to-the-table-of-contents

\newcommand{\tocheader}{{%
\vspace*{-3.7cm}
\begin{center}%
    {\Large\bfseries{Contents}} \\[2em]
    {} \hfill {Page}\par
\end{center}
\vspace*{-1em}
}}
  
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
    
    \fancyhf[ch]{
        \vspace*{-1.5cm}
        \begin{center}%
            {\Large\bfseries{Contents (Cont.)}} \\[1.2cm]
            {} \hfill {Page}\par
            \vspace*{-1em}
        \end{center}
    }
    
    \tocheader
    \begingroup
        % \renewcommand\addvspace[1]{}
        
        \@starttoc{toc}%
        
    \endgroup
    \restoregeometry
    \clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format the List of Tables as the VISTEC Graduate School demands.

%%%%%% number and text spacing %%%%%%%%%
% \def\@dottedtocline#1#2#3#4#5{%

%     \ifnum 
%         #1>\c@tocdepth 
%     \else
%         \vskip \z@ \@plus .2\p@ 
%         \begingroup
%                 \leftskip #2\relax \rightskip 
%                 \@tocrmarg \parfillskip -\rightskip \parindent #2\relax 
%                 \@afterindenttrue \interlinepenalty \@M \leavevmode 
%                 \@tempdima #3\relax 
%                 \advance \leftskip \@tempdima \null \nobreak 
%                 \hskip -\leftskip {#4}\nobreak %
%                 %%% dotfill here
%                 % \leaders \hbox {.}
%                 \hfill \nobreak 
%                 \hb@xt@ \@pnumwidth {\hfil \normalfont \normalcolor #5}\par %     
%         \endgroup
%     \fi
% }

% \def\@dottedtocline#1#2#3#4#5{%

%     \ifnum 
%         #1>\c@tocdepth 
%     \else
%         \leftskip0.1cm
%         \begin{tabular}{p{0.80\linewidth}p{0.10\linewidth}}
%             \begingroup
%                 % \vskip \z@ \@plus .5\p@ 
%                 \leftskip #2\relax \rightskip 
%                 \@tocrmarg \parfillskip -\rightskip \parindent #2\relax 
%                 \@afterindenttrue \interlinepenalty \@M \leavevmode 
%                 \@tempdima #3\relax 
%                 \advance \leftskip \@tempdima \null \nobreak 
%                 \hskip -\leftskip {#4}\nobreak %
%                 %%% dotfill here
%                 % \leaders \hbox {.}
%                 \hfill \nobreak 
%                 \hb@xt@ \@pnumwidth {\hfil}%     
%             \endgroup
%             & 
%             \begingroup
%             % \vskip \z@ \@plus .5\p@  
%             {\hfil #5}
%             \endgroup
%         \end{tabular}

%     \fi
% }


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

\renewcommand{\l@figure}{
    \@dottedtocline{1}{0cm}{1.5cm}
}% Default: 0.25em/2.3em


\let\l@table\l@figure


\newcommand{\totheader}{{%
    \vspace*{-3.7cm}
    \begin{center}%
        {\Large\bfseries{\listtablename}} \\[2em]
        {Table}\hfill{Page}\par
    \end{center}
    \vspace*{-1em}
  }}

  

\renewcommand\listoftables{%
    \clearpage
    \pagestyle{plain}
    \thispagestyle{firstpage} % do not show header footer this page
    \newgeometry{
            left   = 3.75cm, % 3.75+0.5
      	right  = 2.5cm,    % 2.5+0.5
      	top    = 7.5cm,
      	bottom = 2.5cm,
    }
    % \renewcommand\@dotsep{10000}
    \addcontentsline{toc}{chapter}{\listtablename}
    \fancyhf[ch]{
        \vspace*{-1.5cm}
        \begin{center}%
            {\Large\bfseries{\listtablename{ (Cont.)}}} \\[1.2cm]
            {Table}\hfill{Page}\par
        \end{center}
        \vspace*{-1em}
    }
        
    \totheader
    % \patchcmd{\@dottedtocline}{\normalfont}{\bfseries}{}{}
    \begingroup
        % \renewcommand\addvspace[1]{}
        \@starttoc{lot}%
    \endgroup
    \restoregeometry
    \clearpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format the List of Figures as the VISTEC Graduate School demands.

\newcommand{\tofheader}{{%
    \vspace*{-3.7cm}
    \begin{center}%
        {\Large\bfseries{\listfigurename}}\\[2em]
        {Figure}\hfill{Page}\par
    \end{center}
    \vspace*{-1em}
  }}

\renewcommand\listoffigures{%
    \clearpage
    \pagestyle{plain}
    \thispagestyle{firstpage} % do not show header footer this page
    \newgeometry{
            left   = 3.75cm, % 3.75+0.5
      	right  = 2.5cm,    % 2.5+0.5
      	top    = 7.5cm,
      	bottom = 2.5cm,
    }
    % \renewcommand\@dotsep{10000}
        
    \addcontentsline{toc}{chapter}{\listfigurename}

    \fancyhf[ch]{
        \vspace*{-1.5cm}
        \begin{center}%
            {\Large\bfseries{\listfigurename{ (Cont.)}}}\\[1.2cm]
            {Figure}\hfill{Page}\par
        \end{center}
        \vspace*{-1em}
    }
    \tofheader
    \begingroup
        \renewcommand\addvspace[1]{}
        \@starttoc{lof}%
    \endgroup
    \restoregeometry
    \clearpage
    % \fancyhf{}
    
}

%%%%%%%%%%%%%%%%%%%%%%%%%%% Source Code %%%%%%%%%%%%%%%%%%%%%%%%%%% 


\setminted{fontsize=\small,baselinestretch=1,linenos=True,frame=lines, framesep=2mm}

\DeclareCaptionFormat{raggedlefthangcode}{%
    \setlength{\columnsep}{\widthof{#1#2}}
    \begin{varwidth}[t]{\textwidth}%
        \normalsize\singlespacingplus\leftskip\columnsep\parindent -\columnsep\makebox[\columnsep][l]{\bfseries #1}#3%
    \end{varwidth}\par%
}
\captionsetup[listing]{format=raggedlefthangcode, name=Source Code}

\renewcommand{\listingname}{Source Code}% Listing -> Source Code
\renewcommand{\listlistingname}{List of \listingname s}% List of Source Codes ->


%%%%%%%%%%%%%%%%%%%%%%%%%%%  Algorithm %%%%%%%%%%%%%%%%%%%%%%%%%%% 


\newcommand{\algorithmname}{Algorithm}
\renewcommand{\thealgorithm}{\arabic{chapter}.\arabic{algorithm}} 
\DeclareCaptionFormat{raggedlefthangalgo}{%
    \setlength{\columnsep}{\widthof{#1#2}}
    \begin{varwidth}[t]{\textwidth}%
        \normalsize\singlespacingplus\leftskip\columnsep\parindent -\columnsep\makebox[\columnsep][l]{\bfseries #1}#3%
    \end{varwidth}\par%
}
\captionsetup[algorithm]{format=raggedlefthangalgo, name=Algorithm}
\renewcommand{\listalgorithmname}{List of Algorithms}


%%%%%%%%%%%%%%%%%%%%%% List of Algorithms %%%%%%%%%%%%%%%%%%%%%% 
\let\l@algorithm\l@figure%
\let\listofalgorithms\listoffigures% Copy \listoffigures
\patchcmd{\listofalgorithms}{\@starttoc{lof}}{\@starttoc{loa}}{}{}%
\patchcmd{\@chapter}{\addtocontents}{%
% \addtocontents{loa}{\protect\addvspace{10\p@}}%
\addtocontents{loa}{}%
    \addtocontents}{}{}%=
\renewcommand{\l@algorithm}[2]{
    \@dottedtocline{1}{0.25cm}{1.5cm}{#1}{#2}%
}

\newcommand{\toaheader}{{%
    \begin{center}%
    \vspace*{-2.45cm}
        {\Large\bfseries{\listalgorithmname} \normalsize\\[1em]}
        {Algorithm} \hfill {\hfill{Page}}
        \vspace{-1em}
    \end{center}
  }}
  
\let\oldlistofalgorithms\listofalgorithms
\renewcommand{\listofalgorithms}{
    \clearpage
    \thispagestyle{firstpage}
    \newgeometry{
            left   = 3.75cm,
      	right  = 2.5cm,
      	top    = 6.85cm,
      	bottom = 2.5cm,
    }
    \renewcommand\@dotsep{10000}
    \addcontentsline{toc}{chapter}{\listalgorithmname}

    \fancyhf[ch]{
    \vspace*{-0.95cm}
        \begin{center}%
            {\Large\bfseries{\listalgorithmname{ }(Cont.)} \normalsize\\[1em]}
            {Algorithm} \hfill{Page}
        \end{center}
    }
    \toaheader
    \begingroup
        \@starttoc{loa}
    \endgroup
    \restoregeometry
    \clearpage
    % \fancyhf{}
}


    

%%%%%%%%%%%%%%%%%%% References page %%%%%%%%%%%%%%%%%%%%

\newcommand{\vancouverbib}{
    \clearpage
    \addcontentsline{toc}{chapter}{References}
    \begin{center}%
        {\Large\bfseries{References}}
        \normalsize\\[2em]
        % \vspace{12pt}
        % \vskip -\baselineskip
    \end{center}
    \singlespacingplus\normalsize
    \setlength\bibitemsep{0pt}
    \printbibliography[heading=none]
    \clearpage
}


%%%%%%%%%%%%%%%%%% vistec-vancouver ref style %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%       update 16022018      %%%%%%%%%%%%%%%%%%%

% This template is referenced from Vancouver Vistec update 16022018.ens
% https://vistec-my.sharepoint.com/personal/daraporn_m_vistec_ac_th/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fdaraporn%5Fm%5Fvistec%5Fac%5Fth%2FDocuments%2FEndNote&ga=1

\DeclareFieldFormat{title}{\textnormal{#1}}
\DeclareFieldFormat{booktitle}{\textbf{#1}}
\DeclareFieldFormat{journaltitle}{\textbf{#1}}
% \DeclareFieldFormat{publisher}{\textbf{#1}}

% \DeclareBibliographyDriver{article}{%
%     %Author. Title|. Journal|. Year|;Volume|(Issue)|:Pages|.
%     \usebibmacro{author}\adddot\addspace%Author.
%     \printfield{title}\adddot\addspace%Title|.
%     \textbf{\printfield{journaltitle}}\adddot\addspace%Journal|.
%     \iffieldundef{year}{}{\printfield{year};}%Year|;
%     \iffieldundef{volume}{}{\printfield{volume}}%Volume|
%     \iffieldundef{number}{}{(\printfield{number})}%(Issue)
%     \iffieldundef{issue}{}{(\printfield{issue})}%(Issue)
%     \iffieldundef{pages}{}{\printfield{pages}\adddot}%:Pages|.
% }

% \DeclareBibliographyDriver{book}{%
%     %Author. Title|. Edition ed|. Series Editor, `editor`^`editors`|. Place Published|: Publisher; Year| Date|. Number of Pages p|.
%     \usebibmacro{author}\adddot\addspace%Author.
%     \textbf{\printfield{title}}\adddot\addspace%Title|.
%     \iffieldundef{edition}{}{\printfield{edition}\adddot\addspace}% Edition ed|.
%     \iffieldundef{editor}{}{Series Editor,\addspace\printfield{editor}\adddot\addspace}%Series Editor, `editor`^`editors`|.
%     \iffieldundef{editors}{}{Series Editor,\addspace\printfield{editors}\adddot\addspace}%Series Editor, `editor`^`editors`|.
%     \iffieldundef{place}{}{\printfield{place}:\addspace}%Place Published|:
%     \iffieldundef{publisher}{}{\printfield{publisher};\addspace}%Publisher;
%     \iffieldundef{year}{}{\printfield{year}\addspace}%Year|
%     \iffieldundef{date}{}{\printfield{date}\adddot\addspace}%Year|
%     \iffieldundef{pages}{}{\printfield{pages}\addspace p\adddot}% Number of Pages p|.
% }

% \DeclareBibliographyDriver{inproceedings}{%
%     %Author, `editor`^`editors`. Title|. Conference Name; Year of Conference Date|; Conference Location|. Place Published|: Publisher; Year Published|.
%     \usebibmacro{author},\addspace%Author, 
%     \iffieldundef{editor}{}{\printfield{editor}\adddot\addspace}% `editor`^`editors`.
%     \iffieldundef{editors}{}{\printfield{editors}\adddot\addspace}% `editor`^`editors`.
%     \textbf{\printfield{title}}\adddot\addspace% Title|.
%     \iffieldundef{booktitle}{}{\printfield{booktitle};\addspace}% Conference Name;
%     \iffieldundef{location}{}{\printfield{location}\adddot\addspace}%Conference Location|.
%     \iffieldundef{place}{}{\printfield{place}:\addspace}%Place Published|:
%     \iffieldundef{publisher}{}{\printfield{publisher};\addspace}%Publisher;
%     \iffieldundef{year}{}{\printfield{year}\adddot}%Year Published|.
% }

% \DeclareBibliographyDriver{conferencepaper}{%
%     %Author. Title. |In: Editor, `editor`.^`editors`.| Conference Name|; Date|; Conference Location|. Place Published|: Publisher; Year|. p. Pages|.
%     \usebibmacro{author}\adddot\addspace%Author, 
%     \textbf{\printfield{title}}\adddot\addspace% Title|.
%     \iffieldundef{editor}{}{In: Editor,\addspace\printfield{editor}\adddot\addspace}% In: Editor, `editor`^`editors`.
%     \iffieldundef{editors}{}{In: Editor,\addspace\printfield{editors}\adddot\addspace}% In: Editor, `editor`^`editors`.
%     \iffieldundef{booktitle}{}{\printfield{booktitle};\addspace}% Conference Name;
%     \iffieldundef{date}{}{\printfield{date};\addspace}% Conference Name;
%     \iffieldundef{location}{}{\printfield{location}\adddot\addspace}%Conference Location|.
%     \iffieldundef{place}{}{\printfield{place}:\addspace}%Place Published|:
%     \iffieldundef{publisher}{}{\printfield{publisher};\addspace}%Publisher;
%     \iffieldundef{year}{}{\printfield{year}\adddot\addspace}%Year Published|.
%     \iffieldundef{pages}{}{p\adddot\addspace\printfield{pages}\adddot}%Year Published|.
% }

% \DeclareBibliographyDriver{onlinedatabase}{%
%     %Title [`Internet`]. Publisher. Year| [cited Date Accessed]|. `Available from:` URL|.
%     \textbf{\printfield{title}}\addspace[Internet]\adddot\addspace%Title [`Internet`].
%     \iffieldundef{publisher}{}{\printfield{publisher}\adddot\addspace}%Publisher.
%     \iffieldundef{year}{}{\printfield{year}\addspace}%Year|.
%     \iffieldundef{cited_date}{}{[\printfield{cited_date}]\adddot\addspace}%[cited Date Accessed]|.
%     \iffieldundef{url}{}{Available from:\addspace\printfield{url}\adddot}%`Available from:` URL|.
% }

% \DeclareBibliographyDriver{thesis}{%
%     %Author. Title [Thesis Type]|. Place Published|: University; Year|.
%     \usebibmacro{Author}\adddot\addspace%Author.
%     \textbf{\printfield{title}}\addspace[{type}]\adddot\addspace%Title [Thesis Type].
%     \iffieldundef{place}{}{\printfield{place}:}%Place Published|:
%     \iffieldundef{university}{}{\printfield{university}:\addspace}%University;
%     \iffieldundef{year}{}{\printfield{year}\adddot}%Year|.
% }

\endinput

%% End of file `VISTEC.cls'.
