%% 'ntnubachelorthesis.cls' - a LaTeX class for bachelor theses at NTNU
%%
%% Copyright (C) 2016 Simon McCallum
%%
%% CHANGE LOG:
%%
%% importing much from the gucthesis.cls template by Ivar arup
%%
%%
%% TODO:
%%
%%

%% MACRO
\newcommand{\NTNU}{{N}orwegian {U}niversity of {S}cience and {T}echnology (NTNU)} %the extra {'s protect upper case
\newcommand{\NTNUno}{{N}orges teknisk-naturvitenskapelige universitet (NTNU)} 
\newcommand{\NTNUgjovik}{{NTNU} i {G}j\o{}vik}
\newcommand{\NTNUalesund}{{NTNU} i \AA{}lesund}


%% IDENTIFICATION

\xdef\ntnubachelorthesisdate{2017/01/16}
\xdef\ntnubachelorthesisversion{0.2}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ntnuthesis/ntnubachelorthesis}
 [\ntnubachelorthesisdate\space
  v\ntnubachelorthesisversion\space
   Creative Commons Attribution 2016 Simon McCallum and Ivar Farup ]


%% CLASS FILE COMMANDS

\LoadClass[a4paper]{report}

%% PACKAGE LOADING

\RequirePackage{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage{charter}
\RequirePackage{euler}
\RequirePackage{lastpage}
\RequirePackage{babel}
\RequirePackage{enumitem}
\RequirePackage{listings}

\RequirePackage[utf8]{inputenc}     % For utf8 encoded .tex files  % For cross references in pdf
%\RequirePackage[pdftex]{graphicx, hyperref}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage{color}              % For colouring text  
\RequirePackage{pdfpages}    

\RequirePackage{etoolbox}
\RequirePackage{totcount,assoccnt}

\newcounter{totalchapters}
\newcounter{appendixchapters}
\DeclareAssociatedCounters{chapter}{totalchapters,appendixchapters}
\regtotcounter{totalchapters}
\regtotcounter{appendixchapters}

\newcounter{truechapters}
\regtotcounter{truechapters}

\hypersetup{colorlinks=true,     
		linkcolor=blue,          % color of internal links (change box color with linkbordercolor)
    citecolor=blue,        % color of links to bibliography
    filecolor=blue,      % color of file links
    urlcolor=blue           % color of external links
		}
\setlist[enumerate]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[enumerate,1]{label=\arabic*., ref=\arabic*}
\setlist[enumerate,2]{label=\arabic*., ref=\arabic*}
\setlist[enumerate,3]{label=\alph*., ref=\alph*}
\setlist[itemize]{itemsep=0mm, topsep=5pt, partopsep=0mm, parsep=0mm}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\circ$}
\setlist[itemize,3]{label=$\cdot$}
%\RequirePackage[absolute]{textpos}

\preto\appendix{%

\label{endofmain} % for page counting use
  % save the number of true chapters
  \setcounter{truechapters}{\value{chapter}}%
  % reset the number of chapters
  \setcounter{appendixchapters}{0}%
}

%% MAIN PART

% Page geometry and layout
%\setlength{\TPHorizModule}{30mm}
%\setlength{\TPVertModule}{\TPHorizModule}
%\textblockorigin{10mm}{10mm}


\AtBeginDocument{\baselineskip=14pt%
  \parskip=2pt%
  \parindent=14pt%
  \frenchspacing%
  \setcounter{secnumdepth}{2}%
}
\pagenumbering{roman}           % until first chapter, see below

% Header and footer

\def\thesis@title{Use thesistitle to insert your title here.}
\def\thesis@shorttitle{Use thesisshorttitle to insert your shorttitle here.}
\def\thesis@date{Use thesisdate to insert your date here.}
\def\thesis@author{Use thesisauthor to insert your name here.}
\def\thesis@hostInstitution{Use thesisHostInstitution to insert the location of the defense.}
\def\thesis@publishertext{}

% for bachelor theses with multiple authors
\def\thesis@authorA{}
\def\thesis@authorB{}
\def\thesis@authorC{}
\def\thesis@authorD{}

\def\thesis@supervisor{}
\def\thesis@supervisorA{}
\def\thesis@oppdragsgiver{}

%\def\thesis@oppgaveNo{}

\newif\if@oppgaveNo    \@oppgaveNofalse
\def\oppgaveNo#1{\gdef\@oppgaveNo{#1} \@oppgaveNotrue }


\def\nmt@keywords{}
\def\nmt@desc{}
\def\nmt@pub{}

\def\thesis@titleNOR{Use thesistitleNor to insert your title here.}
\def\nmt@keywordsNOR{}
\def\nmt@descNOR{}
\def\nmt@pubNOR{}

\def\nmt@number{}
\def\nmt@appnumber{}
\def\nmt@pagecount{}
\def\nmt@contact{}

\def\thesistitle#1{\def\thesis@title{#1} \def\thesis@shorttitle{#1}}
\def\thesisshorttitle#1{\def\thesis@shorttitle{#1}}
\def\thesisdate#1{\def\thesis@date{#1}}
\def\thesisauthor#1{\def\thesis@author{#1}}
\newif\if@thesisauthorA    \@thesisauthorAfalse
\def\thesisauthorA#1{\def\thesis@authorA{#1} \@thesisauthorAtrue}
\newif\if@thesisauthorB    \@thesisauthorBfalse
\def\thesisauthorB#1{\def\thesis@authorB{#1} \@thesisauthorBtrue}
\newif\if@thesisauthorC    \@thesisauthorCfalse
\def\thesisauthorC#1{\def\thesis@authorC{#1} \@thesisauthorCtrue}
\newif\if@thesisauthorD    \@thesisauthorDfalse
\def\thesisauthorD#1{\def\thesis@authorD{#1} \@thesisauthorDtrue}
\def\thesissupervisor#1{\def\thesis@supervisor{#1}}
\def\thesissupervisorA#1{\def\thesis@supervisorA{#1}}
\def\nmtoppdragsgiver#1{\def\thesis@oppdragsgiver{#1}}
\def\thesisOppgaveNo#1{\def\thesis@OppgaveNo{#1} \thesis@OppgaveNotrue}

\def\thesisHostInstitution#1{\def\thesis@hostInstitution{#1}}
\def\thesisPublisherText#1{\def\thesis@publishertext{#1}}

\def\nmtkeywords#1{\def\nmt@keywords{#1}}
\def\nmtdesc#1{\def\nmt@desc{#1}}
\def\nmtpub#1{\def\nmt@pub{#1}}

\def\nmtkeywordsNOR#1{\def\nmt@keywordsNOR{#1}}
\def\nmtdescNOR#1{\def\nmt@descNOR{#1}}
\def\nmtpubNOR#1{\def\nmt@pubNOR{#1}}
\def\thesistitleNOR#1{\def\thesis@titleNOR{#1}}


\def\nmtpagecount#1{\def\nmt@pagecount{#1}}
\def\nmtappnumber#1{\def\nmt@appnumber{#1}}
\def\nmtcontact#1{\def\nmt@contact{#1}}

\def\ps@ntnuheadings{%
  \def\@oddfoot{\reset@font\hfil\thepage\hfil}
  \def\@oddhead{\underline{\hbox
      to\hsize{\fontsize{7}{9}\selectfont\hfil\thesis@shorttitle}}}
  \def\@evenhead{\underline{\hbox
      to\hsize{\fontsize{7}{9}\selectfont\thesis@shorttitle\hfil}}}
  \let\@evenfoot=\@oddfoot}

\pagestyle{ntnuheadings}
% Empty page does not have header or footer
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% Title page

%%\def\@subtitle{\relax}
%%\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
%%\renewcommand{\maketitle}{
%%	\newpage
%%	\null
%%	\vskip 2em%
%%	\begin{center}%
%%	\let \footnote \thanks
%%	{\LARGE \@title \par}%
%%	\vskip 1.5em%
%%	{\large
%%		\lineskip .5em%
%%		\begin{tabular}[t]{c}%
%%		\@author
%%		\end{tabular}\par}%
%%	\vskip 1em%
%%	{\large \@date}%
%%	\end{center}%
%%	\par
%%	\vskip 1.5em
%%}



\def\thesistitlepage{
  \title{\thesis@title}
  \date{\thesis@date}
  \author{\thesis@author}
  \maketitle
}

% Sectioning commands

\def\section{\@startsection
  {section}%
  {1}%
  {0mm}%
  {-10pt}%
  {4pt}%
  {\normalfont\fontsize{12}{14}\selectfont\bfseries}%
}
   
\def\subsection{\@startsection
  {subsection}%
  {2}%
  {0mm}%
  {-6pt}%
  {2pt}%
  {\normalfont\fontsize{10.5}{14}\selectfont\bfseries}%
}

\def\subsubsection{\@startsection
  {subsubsection}%
  {3}%
  {0mm}%
  {-6pt}%
  {2pt}%
  {\normalfont\normalsize\selectfont\bfseries}%
}

\def\paragraph{\@startsection
  {paragraph}%
  {4}%
  {0mm}%
  {-6pt}%
  {2pt}%
  {\normalfont\normalsize\selectfont\itshape}%
}

\newcounter{firstchapter}       % hack to find out where to start
\c@firstchapter=1               % arabic page numbering, see below

\newcounter{tmpfig}             % hack to have continuous numbering of
\newcounter{tmptab}             % figures and tables, see below

\newcounter{numapp}
\newcommand{\numberofapp}{%
    \immediate\write\@auxout%
      {\string\setcounter{numapp}{\the\c@chapter}}%
}



\renewcommand\chapter{%\if@openright\cleardoublepage\else\clearpage\fi
  \cleardoublepage
%  \thispagestyle{plain}%
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
  \c@tmpfig=\c@figure           % hack for figure and table numbering
  \c@tmptab=\c@table
  \refstepcounter{chapter}%
  \c@figure=\c@tmpfig
  \c@table=\c@tmptab
  \ifnum\c@firstchapter = 1     % hack for page numbering
  \pagenumbering{arabic}
  \c@page=1 \c@firstchapter=0
  \fi
  \typeout{\@chapapp\space\thechapter.}%
  \phantomsection
  \addcontentsline{toc}{chapter}%
  {\protect\numberline{\thechapter}#1}%
  \else
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%

% Add extra space in list of figures and list of tables between
% figures & tables belonging to different chapters:
  \addtocontents{lof}{\protect\addvspace{5\p@}}%
  \addtocontents{lot}{\protect\addvspace{5\p@}}%
  \if@twocolumn
  \@topnewpage[\@makechapterhead{{#2}}]%
  \else
  \@makechapterhead{{#2}}%
  \@afterheading
  \fi}
\def\@makechapterhead#1{%
  \vspace*{24\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
    \begin{center}
    \normalfont\fontsize{14}{14}\selectfont\bfseries\thechapter
    \fi
    \normalfont\fontsize{14}{14}\selectfont\bfseries\quad #1
    \end{center}\par\nobreak
    \vskip 12\p@
  }}
\def\@schapter#1{\if@twocolumn
  \@topnewpage[\@makeschapterhead{{#1}}]%
  \else
  \@makeschapterhead{{#1}}%
  \@afterheading
  \fi
  \phantomsection
  \addcontentsline{toc}{chapter}{#1}% Contentsline also for \chapter*
}
\def\@makeschapterhead#1{%
  \vspace*{24\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \begin{center}\fontsize{14}{14} \bfseries  #1\end{center}\par\nobreak
    \vskip 12\p@
  }}

% Table of contents

\def\l@chapter#1#2{\@dottedtocline{1}{0em}{1.5em}{\bf #1}{\bf #2}}

% Table and figure captions

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\fontsize{9}{13}\selectfont #1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    \fontsize{9}{13}\selectfont #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% Table and figure numbering without chapter number

\def\thefigure{\@arabic\c@figure}
\def\thetable{\@arabic\c@table}

% Quotes

\renewenvironment{quote}
{\list{}{\rightmargin\leftmargin\fontsize{9}{12}\selectfont}%
\item\relax}
{\endlist}

% Lists (itemize and enumerate)

%% removed the old itemize material as it should be in a package enumitem
%%
%% NMT Frontpage by Simon:
%%

\newcommand{\nmt@frontpagesyear}{%
Use $\backslash$useyear\{<year>\} to set year.
}

\newcommand{\useyear}[1]{%
  \renewcommand{\nmt@frontpagesyear}{#1}
}


\newcommand\nmt@firstpagetext{%
  \noindent Use this class with options\\ 
  ``BSP'' Bachelor i Spillprogrammering,\\
  ``BRD'' Bachelor i drift av nettverk og datasystemer,\\
  ``BIS'' Bachelor i Informasjonssikkerhet,\\
  ``BPU'' Bachelor i Programvareutvikling, \\
  ``BIND'' Bachelor i Ingeni\o{}rfag - data, \\
  ``BADR'' Bachelor i drift av datasystemer, \\
  ``BIT'' Bachelor i informatikk, \\
  ``BMAT'' Bachelor i Materialteknolgi, \\
  ``BABED'' Bachelor i IT-støttet bedriftsutvikling.
}

\newcommand\nmt@secondpagetext{%
  \noindent Use this class with options\\ 
  ``BSP'' Bachelor i Spillprogrammering,\\
  ``BRD'' Bachelor i drift av nettverk og datasystemer,\\
  ``BIS'' Bachelor i Informasjonssikkerhet,\\
  ``BPU'' Bachelor i Programvareutvikling, \\
  ``BIND'' Bachelor i Ingeni\o{}rfag, \\
  ``BADR'' Bachelor i drift av datasystemer, \\
  ``BIT'' Bachelor i informatikk, \\
  ``BMAT'' Bachelor i Materialteknolgi, \\
  ``BABED'' Bachelor i IT-støttet bedriftsutvikling.
}

	    

%% OPTIONS (declare more here if needed)

\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse%
\geometry{a4paper, left=3.75cm, right=3.75cm, top=3cm, bottom=4cm,
  head=1.2cm, foot=2cm}}
	
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue%
\geometry{a4paper, left=4.5cm, right=3cm, top=3cm, bottom=4cm,
  head=1.2cm, foot=2cm}}

\newif\if@norsk
\newif\if@nynorsk
\newif\if@english

	\newcommand\nmt@DepartmentNameText{}
	\newcommand\nmt@IDI{
		Department of Computer Science\\
		\NTNU, 
		}
	\newcommand\nmt@IIK{
			Department of Information Security and Communication Technology\\
		\NTNU, 
		}	
	\newcommand\nmt@MSE{
			Department of Material Science and Engineering\\
		\NTNU, 
		}
	
	\newcommand\nmt@DegreeNameText{}
  \newcommand\nmt@BSP{Bachelor in Game Programming}
  \newcommand\nmt@BPROG{Bachelor in Programming [Games|Applications]}
  \newcommand\nmt@BRD{Bachelor of Science in Network and System Administration}
  \newcommand\nmt@BIS{Bachelor in Information Security}
  \newcommand\nmt@BPU{Bachelor in Software Engineering}
  \newcommand\nmt@BIND{Bachelor of Science in Engineering - Computer Science}
  \newcommand\nmt@BADR{Bachelor in Information Technology\\with specialization in Network administration}
  \newcommand\nmt@BIT{Bachelor in Information Technology}
  \newcommand\nmt@BABED{IT-supported Business Architecture}
  \newcommand\nmt@BME{Bachelor in Materials Engineering}
  \newcommand\nmt@BCE{Bachelor in Chemical Engineering}
  
  \newcommand\nmt@AuthorText{Author(s)}
	\newcommand\nmt@SupervisorText{Supervisor}
\newcommand\thesis@titlehead{\thesis@title}	


\DeclareOption{norsk}{
	\select@language{norsk}
	\renewcommand\nmt@IDI{%
	   Institute for Datateknikk og Informatikk\\
	 	\NTNUno, 
	}
	\renewcommand\nmt@IIK{
			Institutt for informasjonssikkerhet og kommunikasjonsteknologi\\
		\NTNUno, 
		}	
	
	
  \renewcommand\nmt@BSP{Bachelor i spillprogrammering}
  \renewcommand\nmt@BPROG{Bachelor i programmering[spill|apps]}
  \renewcommand\nmt@BRD{Bachelor i drift av nettverk og datasystemer}
  \renewcommand\nmt@BIS{Bachelor i informasjonssikkerhet}
  \renewcommand\nmt@BPU{Bachelor i programvareutvikling}
  \renewcommand\nmt@BIND{Bachelor i ingeni\o{}r - data}
  \renewcommand\nmt@BADR{Bachelor i informatikk med spesialisering i drift av datasystemer}
  \renewcommand\nmt@BIT{Bachelor i informatikk}
  \renewcommand\nmt@BABED{Bachelor i IT-støttet bedriftsutvikling}
  \renewcommand\nmt@BME{Bachelor i ingeniørfag}
  \renewcommand\nmt@BCE{Bachelor i ingeniørfag}


  \renewcommand\nmt@AuthorText{Forfattere}
	\renewcommand\nmt@SupervisorText{Veileder}
	
	\renewcommand\thesis@titlehead{\thesis@titleNOR}

   \@norsktrue 
   \@nynorskfalse 
   \@englishfalse
}

\DeclareOption{english}{
   \@englishtrue 
   \@nynorskfalse
   \@norskfalse
}

\DeclareOption{nynorsk}{
\select@language{nynorsk}

	\renewcommand\nmt@DepartmentNameText{%
	   Institute for datateknikk og informatikk\\
	 	\NTNUno, 
	}
	\renewcommand\nmt@BSP{Bachelor i spillprogrammering}
  \renewcommand\nmt@BRD{Bachelor i drift av nettverk og datasystemer}
  \renewcommand\nmt@BIS{Bachelor i informasjonssikkerhet}
  \renewcommand\nmt@BPU{Bachelor i programvareutvikling}
  \renewcommand\nmt@BIND{Bachelor i Ingeni\o{}r - data}
  \renewcommand\nmt@BADR{Bachelor i informatikk med spesialisering i drift av datasystemer}
  \renewcommand\nmt@BIT{Bachelor i informatikk}
  \renewcommand\nmt@BABED{Bachelor i IT-støttet bedriftsutvikling}

  \renewcommand\nmt@AuthorText{Forfattere}
	\renewcommand\nmt@SupervisorText{Veileder}

   \@englishfalse 
   \@nynorsktrue
   \@norskfalse
}


	

\DeclareOption{BSP}{%
  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IDI
			}
  \renewcommand\nmt@DegreeNameText{%
    	\nmt@BSP
			}


			}

\DeclareOption{BPROG}{%
  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IDI
			}
	\renewcommand\nmt@DegreeNameText{%
    	\nmt@BPROG
			}
			
			}

\DeclareOption{BRD}{%  
  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IIK
			}
	\renewcommand\nmt@DegreeNameText{%
    	\nmt@BRD
			}}

\DeclareOption{BIND}{%
  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IDI
			}
	\renewcommand\nmt@DegreeNameText{%
    	\nmt@BIND
			}}
			
\DeclareOption{BIS}{%
  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IIK
			}
	\renewcommand\nmt@DegreeNameText{%
    	\nmt@BIS
			}}

\DeclareOption{BPU}{%

  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IDI
			}
	\renewcommand\nmt@DegreeNameText{%
    	\nmt@BPU
			}
}

\DeclareOption{BADR}{%
  \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IDI
			}
	\renewcommand\nmt@DegreeNameText{%
        \nmt@BADR
            }
}

\DeclareOption{BIT}{%
    \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IDI
			}
	\renewcommand\nmt@DegreeNameText{%
        \nmt@BIT
            }
}

\DeclareOption{BABED}{%
    \renewcommand\nmt@DepartmentNameText{%
    	\nmt@IDI
			}
	\renewcommand\nmt@DegreeNameText{%
        \nmt@BABED
            }
}

\DeclareOption{BMS}{%
    \renewcommand\nmt@DepartmentNameText{%
    	\nmt@MSE
			}
	\renewcommand\nmt@DegreeNameText{%
        \nmt@BMS
            }
}

\DeclareOption{BCE}{%
    \renewcommand\nmt@DepartmentNameText{%
    	\nmt@MSE
			}
	\renewcommand\nmt@DegreeNameText{%
        \nmt@BCE
            }
}


  \renewcommand\nmt@firstpagetext{%
    \begin{tabular}{c}
    	\nmt@DegreeNameText\\
    	20 ECTS\\
    	\nmt@DepartmentNameText\\
    \end{tabular}
  }

\ProcessOptions\relax





%% FRONTPAGE GENERATION
\newcommand\makefrontpages{%
	  \makebachelorfrontpages
}




\newcommand\makebachelorfrontpages{%
  \begin{titlepage}%
    %\thispagestyle{empty}
    %\setcounter{page}\z@
		\hypersetup{pageanchor=false}

    \let\footnotesize\small
    \let\footnoterule\relax
    \let \footnote \thanks
    \null\vfil
    \includegraphics[width=200pt]{ntnuthesis/hovedlogo_eng} \\    
    \vskip 75\p@
    \begin{center}%
        { \fontsize{22}{25}
            \selectfont \thesis@titlehead}%
            \vskip 3em%
            {\large
	            \lineskip .75em%
                \fontsize{14}{16}
                \selectfont{ 
                    \nmt@AuthorText}\\
                    \begin{tabular}[10cm]{p{1.5cm}l}%
                    \rule[-4cm]{0cm}{4cm} & {\fontsize{14}{16}\selectfont 
                        \parbox{6cm}{
		                \thesis@author \\
                        \thesis@authorA \\
                         \thesis@authorB \\
                        \thesis@authorC \\
                       \thesis@authorD \\
                    } 
                \par}
        \end{tabular}\par}
	\vskip 1em
	\fontsize{14}{16} \selectfont{
	\nmt@firstpagetext \\
	\vskip 1em
  \nmt@frontpagesyear}
	
	
	\end{center}%
	
	\vspace*{\fill}
	{\fontsize{14}{16}\selectfont{	
	\nmt@SupervisorText
  }
	\hspace*{21.5mm}{	\thesis@supervisor\\}
	\hspace*{61.5mm}{	\thesis@supervisorA\\} \par}
		
  \end{titlepage}

 \cleardoublepage
  
  \newpage
  {%
    \fontsize{14}{16}\selectfont 
    Sammendrag av Bacheloroppgaven\\
	\par}
%\addcontentsline{toc}{chapter}{Summary}
%\thispagestyle{empty}
\begin{tabular}{p{0.35\textwidth}@{  }p{0.65\textwidth}}
	Tittel: & \textbf{\thesis@titleNOR}\\
		&\\
\if@oppgaveNo \\Oppgave no.  & \@oppgaveNo\\ \fi	
    Dato: & \nmt@frontpagesyear\\
		&\\
	Deltakere: & \thesis@author\\
		\if@thesisauthorA & \thesis@authorA\\ \fi
		\if@thesisauthorB & \thesis@authorB\\ \fi
		\if@thesisauthorC & \thesis@authorC\\ \fi
        \\
	Veiledere: & \thesis@supervisor\\
		& \thesis@supervisorA\\
		&\\
	Oppdragsgiver: & \thesis@oppdragsgiver\\
		&\\
	Kontaktperson: & \nmt@contact\\
		&\\
	N\o{}kkelord: & \nmt@keywordsNOR\\
	Antall sider: & \pageref{endofmain}\\
	Antall vedlegg: & \total{appendixchapters}\\
	Tilgjengelighet: & Åpen kildekode iht. lisens GPLv3\\
		&\\
	\hline\\
	Sammendrag: & \nmt@descNOR\\
  \end{tabular}

% this should be a function call so that the layout is done in a single place. This is currently bad coding but I do not have time to fix it at the moment.  Can be fixed this later.
\cleardoublepage
  
  \newpage
  {%
    \fontsize{14}{16}\selectfont 
    Summary of Graduate Project\\
	\par}
%\addcontentsline{toc}{chapter}{Summary}
%\thispagestyle{empty}
\begin{tabular}{p{0.35\textwidth}@{  }p{0.65\textwidth}}
	Title: & \textbf{\thesis@title}\\
		&\\
		\if@oppgaveNo \\Project no.  & \@oppgaveNo\\ \fi
%	Project no.: &	\thesis@OppgaveNo \\
	Date: & \nmt@frontpagesyear\\
		&\\
	Authors: & \thesis@author\\
		\if@thesisauthorA & \thesis@authorA\\ \fi
		\if@thesisauthorB & \thesis@authorB\\ \fi
		\if@thesisauthorC & \thesis@authorC\\ \fi
		\\
	Supervisor: & \thesis@supervisor\\
		& \thesis@supervisorA\\
		&\\
	Employer: & \thesis@oppdragsgiver\\
		&\\
	Contact Person: & \nmt@contact\\
		&\\
	Keywords: & \nmt@keywords\\
	Pages: & \pageref{endofmain}\\
	Attachments: & \total{appendixchapters}\\
	Availability: & Open source licensed under GPLv3\\ % this needs updating to use \nmt@pub}\\
		&\\
	\hline\\
	Abstract: & \nmt@desc\\
\end{tabular}

		\hypersetup{pageanchor=true}

}
