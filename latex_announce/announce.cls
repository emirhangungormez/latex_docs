\DeclareOption{cmfonts}{%
  \let\QJMAM@fonts\relax}
\DeclareOption{epsfig}{\AtEndOfClass{\RequirePackage{epsfig}}}
\DeclareOption{eqseq}{\AtEndOfClass{\eqnotbysec}}
\DeclareOption{eqbysec}{\AtEndOfClass{\eqnobysec}}
\ExecuteOptions{cmfonts,epsfig}
\ProcessOptions
\AtEndOfClass{\QJMAM@fonts}
\LoadClass[a4paper,twoside]{article}


%Page layout
\oddsidemargin  2pc
\evensidemargin 2pc
\topmargin 3pc
\headheight 12pt
\headsep    16pt
\topskip =  12pt
\footskip 16pt

\textheight = 45\baselineskip \advance\textheight by \topskip
\textwidth 33pc
\footnotesep 6pt
\skip\footins 12pt plus 6pt minus 4pt 

\setcounter{topnumber}{3}
\def\topfraction{1}
\setcounter{bottomnumber}{2}
\def\bottomfraction{.8}
\setcounter{totalnumber}{4}
\def\textfraction{0}
\def\floatpagefraction{.8}
\setcounter{dbltopnumber}{3}
\def\dbltopfraction{1}
\def\dblfloatpagefraction{.8}

\floatsep 12pt plus 6pt minus 1pt 
\textfloatsep 18pt plus 6pt minus 3pt
\intextsep 18pt plus 3pt minus 2pt
\@fptop 0pt plus 0fil
\@fpsep 12pt plus 0fil
\@fpbot 0pt plus 3fil

\parskip \z@ %plus .1pt
\parindent 1em
\partopsep 0pt plus 0pt

\@lowpenalty   51      % Produced by \nopagebreak[1] or \nolinebreak[1]
\@medpenalty  151      % Produced by \nopagebreak[2] or \nolinebreak[2]
\@highpenalty 301      % Produced by \nopagebreak[3] or \nolinebreak[3]

\@beginparpenalty -\@lowpenalty    % Before a list or paragraph environment.
\@endparpenalty   -\@lowpenalty    % After a list or paragraph environment.
\@itempenalty     -\@lowpenalty    % Between list items.

\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\setlength\leftmargini  {2em}
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\renewcommand\labelenumi{\theenumi.}
\renewcommand\labelenumii{(\theenumii)}
\renewcommand\labelenumiii{\theenumiii.}
\renewcommand\labelenumiv{\theenumiv.}

\clubpenalty=0        % 'Club line'  at bottom of page is OK.
\widowpenalty=10000   % 'Widow line' at top of page is not good.

\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
    \advance\@enumdepth \@ne 
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
    {\csname label\@enumctr\endcsname}{\usecounter
    {\@enumctr}\def\makelabel##1{##1\hss}%
    \labelsep=0\p@
\parsep=0pt\listparindent=0pt\itemsep=0pt\partopsep=0pt
    \rightmargin=0pt}\fi}
%
\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \list{\csname\@itemitem\endcsname}{\def\makelabel##1{##1\hss}%
    \labelsep=0\p@\parsep=0pt\listparindent=0pt\itemsep=0pt\partopsep=0pt
    \rightmargin=0pt}\fi}



%Define titles etc
\def\title{\@dblarg\qjmam@title}
\def\qjmam@title[#1]#2{%
  \def\@title{#2}%
  \def\@shorttitle{#1}
  }
\def\author{\@dblarg\qjmam@author}
\def\qjmam@author[#1]#2{%
  \def\@author{#2}%
  \def\@shortauthors{#1}
  \def\and{{\normalfont\itshape\lowercase{\andname\/}\space\rm}}
  }
\def\address#1{%
  \def\@address{{\normalsize(\itshape #1\/\rm)}}%
  }
\def\@extraaddress{\@empty}
\def\extraauthor#1{\g@addto@macro\@extraaddress{\vspace*{2pt}{#1}\par\addvspace{6pt}}}
\def\lextraauthor#1{\g@addto@macro\@extraaddress{\vspace*{2pt}{#1}\par\addvspace{6pt}}}
\def\andextraauthor#1{\g@addto@macro\@extraaddress{\vspace*{2pt}\and\,{#1}\par\addvspace{6pt}}}
\def\extraaddress#1{\g@addto@macro\@extraaddress{{\normalsize(\itshape #1\/\rm)}\par\addvspace{6pt}}}



\def\received#1{%
  \def\@received{%
    \vspace*{2pt}
    \def\recd{Received\ }
    \def\revd{Revise\ }
    \small{[#1]}
  }
}

\def\maketitle{%
  \newpage
  \thispagestyle{titlepage}\label{FirstPage}
  \null
  \setcounter{footnote}{1}
  \@maketitle
  \@thanks
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  \sloppy
}

\def\@maketitle{%
  \begin{center}%
  \let \footnote \thanks
\vspace{-2pc}
    {\Large \MakeUppercase{\@title} \par}%
    \vskip 12pt%
    {\normalsize
%      \lineskip .5em%
      \begin{center}%
        \baselineskip 11pt{\itshape by\,\space}{\@author}\par
        \addvspace{6pt}
        \@address\par
        \addvspace{6pt}
\ifx\@extraaddress=\@empty
\else
\addvspace{6pt}
\@extraaddress
\fi
        \@received
      \end{center}\par}%
  \end{center}%
  \par
  \vskip 0pt
}
\def\ps@qjmam{%
  \def\@oddhead{%
      \relax
      \hfil
      {\scshape\MakeLowercase{\@shorttitle}\relax}
      \hfil
      \thepage}%
  \def\@evenhead{%
      \thepage
      \hfil
      {\let\oldetal=\etal\def\etal{\fontshape{it}\fontsize{8}{12}\selectfont ET~AL.}
\scshape{\@shortauthors}\let\etal=\oldetal\relax}%
      \hfil
      \relax}%
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty}

\def\ps@titlepage{%
  \let\@oddhead\@empty
  \let\@evenhead\@oddhead
  \def\@oddfoot{%
      {\vbox{\hsize\textwidth\@parboxrestore\footnotesize
         {\bfseries\journalname\ (\@volumeyear)\ \@volumenumber\  (\@issuenumber),\ 
            \@startpage--\@endpage}\hfill
         \copyright\ {\bfseries\copyrightname\space\@volumeyear\endgraf}}}%
     \relax
     \relax}%
  \let\@evenfoot\@empty}

\ps@qjmam

\def\abstractname{Bildiri Notu}
\def\@volumeyear{????}
\def\@volumenumber{??}
\def\@issuenumber{??}
\def\yr#1{\gdef\@volumeyear{#1}}
\def\vol#1{\gdef\@volumenumber{#1}}
\def\issue#1{\gdef\@issuenumber{#1}}
\def\@startpage{\pageref{FirstPage}}
\def\@endpage{\pageref{LastPage}}
\def\startpage#1{\gdef\@startpage{#1}\c@page#1}
\def\endpage#1{\gdef\@endpage{#1}}
\def\lastpage@putlabel{%
  \advance\c@page\m@ne
   \immediate\write\@auxout{\string
   \newlabel{LastPage}{{}{\thepage}}}%
   \advance\c@page\@ne}
\AtEndDocument{%
   \clearpage\lastpage@putlabel}%

\def\journalname{Senate Bildirisi}
\def\copyrightname{Anticverse}
\def\andname{and}
\def\etalname{{\it}}
\def\etal{\etalname\ }

%Sections etc
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-12pt \@plus -6pt \@minus -3pt}%
                                   {3pt \@plus.1pt \@minus 1pt}%
                                   {\noindent\normalfont\normalsize\bfseries\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-12pt plus -6pt minus -3pt}%
                                     {3pt plus 1pt minus 1pt}%
                                     {\noindent\raggedright\normalfont\normalsize\itshape}}
%\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                     {1.5ex \@plus .2ex}%
%                                     {\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{subsubsection}{3}{\z@}%
                                    {-12pt}%
                                    {-1em}%
                                    {\normalfont\normalsize\itshape}}
%\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
%                                       {3.25ex \@plus1ex \@minus .2ex}%
%                                       {-1em}%
%                                      {\normalfont\normalsize\bfseries}}


\def\@sect#1#2#3#4#5#6[#7]#8{\ifnum #2=1\def\@jt{.\hskip 0.5em}\else
\def\@jt{\hskip 0.5em}\fi
\ifnum #2>\c@secnumdepth
  \def\@svsec{}
 \else \refstepcounter{#1}
  \edef\@svsec{\csname the#1\endcsname\@jt}\fi
 \@tempskipa #5\relax
 \ifdim \@tempskipa>\z@
  \begingroup #6\relax
   \@hangfrom{\hskip #3\relax
   \ifnum#2=2 {\rm\@svsec} \else \@svsec\fi}{\interlinepenalty \@M #8\par}
  \endgroup
  \csname #1mark\endcsname{#7}%
  \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth \else
    \protect\numberline{\csname the#1\endcsname}\fi #7}
 \else
\def\@svsechd{#6\hskip #3%   
\ifnum#2=3 {\rm\@svsec} \else \@svsec\fi%
 #8\csname #1mark\endcsname
    {#7}\addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth \else
      \protect\numberline{\csname the#1\endcsname}\fi#7}}
 \fi
 \@xsect{#5}}


%Theorems etc

\renewenvironment{abstract}{%
      \null
      \vspace{-.5em}
      \begin{center}%
        {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}
      \end{center}        
      \list{}{\leftmargin 2.7em \rightmargin\leftmargin\parsep 0pt plus 0pt\listparindent 1em\labelsep \z@}
\item[]\small\ignorespaces\par
}%
     {\endlist\par\vspace*{6pt}\sloppy}
\renewenvironment{quotation}
               {\list{}{\listparindent 1em%
                        \itemindent    \listparindent
                        \rightmargin 0pt
                        \leftmargin 1em
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\renewenvironment{quote}
               {\list{}{\rightmargin 0pt
                \leftmargin 1em}%
                \item\relax}
               {\endlist}

\RequirePackage{amsthm}
\renewenvironment{proof}[1][\proofname]{\par
  \normalfont
  \topsep6\p@\@plus6\p@ \trivlist
  \item[\hskip\labelsep\itshape
    #1\@addpunct{.}]\ignorespaces
}{%
  \endtrivlist
}
\newtheoremstyle{theor}
    {6pt}% above space (default)
    {6pt}% below space
    {\itshape}% body
    {0em}% indent
    {\scshape}% head
    {.}% punct
    { }% space
    {}% custom
\theoremstyle{theor}

%\newtheorem{lemma}{Lemma}
%\def\thelemma{\arabic{lemma}}
%\newtheorem{definition}[lemma]{Definition}
%\newtheorem{corollary}[lemma]{Corollary}
%\newtheorem{theorem}[lemma]{Theorem}
%\newtheorem{proposition}[lemma]{proposition}



\newtheoremstyle{remark}
    {6pt}% above space (default)
    {6pt}% below space
    {\normalfont}% body
    {0em}% indent
    {\scshape}% head
    {.}% punct
    { }% space
    {}% custom
\theoremstyle{remark}

%\newtheorem{remark}{Remark}
%\newtheorem{algorithm}{Algorithm}

\def\figurename{Fig.}
\def\fnum@figure{{\normalfont\small\bfseries\figurename~\thefigure}\small}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1\ \, #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1\ \, #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

\def\fnum@table{{\bfseries\tablename~\thetable}}

%References

\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{,\penalty\@m\ }%
     \def\@tempa##1##2\@nil{\edef\@citeb{\if##1\space##2\else##1##2\fi}}%
     \expandafter\@tempa\@citeb\@nil
     \hbox{\bf{\csname b@\@citeb\endcsname}}}}{#1}}
\def\@cite#1#2{({#1\if@tempswa , #2\fi})}



\def\thebibliography#1{\section*{References}
  \addcontentsline{toc}{section}{References}
\list
 {\hfil{\bf\arabic{enumi}.}}{\topsep=0\p@\parsep=0\p@
 \partopsep=0\p@\itemsep=0\p@
 \labelsep=5\p@\itemindent=-10\p@
 \settowidth\labelwidth{\normalsize[#1]}%
 \leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \advance\leftmargin -\itemindent
 \advance\leftmargin -4pt
 \normalsize\usecounter{enumi}}
 \def\newblock{\hskip .02em plus .01em minus .02em}
 \sloppy\clubpenalty4000\widowpenalty4000
 \hyphenpenalty3000
 \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist

\def\eqalign#1{\null\vcenter{\def\\{\cr}\openup\jot\m@th
  \ialign{\strut$\displaystyle{##}$\hfil&$\displaystyle{{}##}$\hfil
      \crcr#1\crcr}}\,}

\newcommand{\dash}{\mbox{\rule[1mm]{2em}{.15mm}}}
\newcommand{\Z}{\hphantom{0}}       %  Helpful for align in tabular  %
\newcommand{\X}{$\cdot$}            %  Centre decimal in tabular  %


\renewcommand{\cases}[1]{%
   \left\{
   \begin{array}{@{}l@{\quad}l@{}}
   #1
   \end{array}
   \right.
}


\newcommand{\case}[2]{{\textstyle\frac{#1}{#2}}}

%equations numbered by section
\newif\if@eqnobysec
\def\theequation{\if@eqnobysec
      \arabic{section}.\arabic{equation}\else
      \arabic{equation}\fi}
\def\eqnobysec{\@eqnobysectrue\@addtoreset{equation}{section}}
\def\eqnotbysec{\@eqnobysecfalse}



%\def\appendix{\par
% \@addtoreset{table}{section}        
% \@addtoreset{figure}{section} 
% \@addtoreset{equation}{section}
% \setcounter{section}{0}
% \setcounter{subsection}{0}
% \setcounter{subsubsection}{0}
% \setcounter{equation}{0}
% \setcounter{figure}{0}
% \setcounter{table}{0}
%  \renewcommand\theequation{%
%     \if@eqnobysec
%        \@Alph\c@section.\@arabic\c@equation
%     \else
%        \@Alph\c@section\@arabic\c@equation
%     \fi
%  }
%  \renewcommand\thesection{\@Alph\c@section}
%  \renewcommand\thetable{\@Alph\c@table}
%  \renewcommand\thefigure{%
%\if@eqnobysec
%        \@Alph\c@section.\@arabic\c@figure
%     \else
%        \@Alph\c@section\@arabic\c@figure
%     \fi
%  }
\renewcommand\appendix{\par
  \@addtoreset{table}{section}        
  \@addtoreset{figure}{section} 
  \@addtoreset{equation}{section} 
  \setcounter{section}{0}
  \setcounter{subsection}{0}
  \setcounter{subsubsection}{0}
  \setcounter{equation}{0}
  \setcounter{figure}{0}
  \setcounter{table}{0}
  \renewcommand\theequation{\rm
     \if@eqnobysec
       \rm \@Alph\c@section.\@arabic\c@equation
     \else
       \rm \@Alph\c@section\@arabic\c@equation
     \fi
  }
  \renewcommand\thesection{\@Alph\c@section}
  \renewcommand\thetable{\@Alph\c@table}
  \renewcommand\thefigure{\@Alph\c@figure}%



\renewcommand{\section}[1]{\refstepcounter{section}\par\vspace{12pt plus 6pt
minus 3pt}
\noindent\parbox[c]{32pc}{\normalsize\rm\centering APPENDIX~\@Alph\c@section}\par
 \vspace{4pt plus 1pt minus 1pt}
\noindent{\itshape ##1}\par\nobreak
 \vspace{3pt plus 1pt minus 1pt}
\def\subsection{\@startsection{subsection}{2}{\z@}
% {-8pt plus -4pt minus -2pt}
% {-3pt plus -1pt minus -1pt}
{-12pt plus -6pt minus -3pt}%
{3pt plus 1pt minus 1pt}% 
%{\noindent\small\itshape}}
 {\noindent\raggedright\small\itshape}}
}
\small
}

\hyphenpenalty3000
\doublehyphendemerits8000
\finalhyphendemerits10000
\sloppy

%\def\itsc{\protect\pitsc}
%\def\pitsc{\series{sc}\shape{it}\selectfont}
\renewcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.65em{\hss$\@makefnmark$}\space#1}
\renewcommand{\thefootnote}{\mbox{$\fnsymbol{footnote}$}}
\@addtoreset{footnote}{page}
\def\@fnsymbol#1{\ifcase#1\or \dagger\or \ddagger\or
   \mathchar "278\or \mathchar "27B\or \|\or **\or \dagger\dagger
   \or \ddagger\ddagger \else\@ctrerr\fi\relax}

\def\eqcu{&\!\!\!=\!\!\!&}

\newcounter{eqnval}
\def\numparts{\addtocounter{equation}{1}%
     \setcounter{eqnval}{\value{equation}}%
     \setcounter{equation}{0}%
     \def\theequation{\if@eqnobysec
     \arabic{section}.\arabic{eqnval}{{\rm \alph{equation}}}%
     \else\arabic{eqnval}{{\rm \alph{equation}}}\fi}}
%
\def\endnumparts{\def\theequation{\if@eqnobysec
     \arabic{section}.\arabic{equation}\else
     \arabic{equation}\fi}%
     \setcounter{equation}{\value{eqnval}}}

\def\eqnarray{%
   \stepcounter{equation}%
   \def\@currentlabel{\p@equation\theequation}%
   \global\@eqnswtrue
   \m@th
   \global\@eqcnt\z@
   \tabskip\@centering
   \let\\\@eqncr
   $$\everycr{}\halign to\displaywidth\bgroup
       \hskip\@centering$\displaystyle\tabskip\z@skip{##}$\@eqnsel
      &\global\@eqcnt\@ne\hskip \tw@\arraycolsep \hfil$\displaystyle{##}$\hfil
      &\global\@eqcnt\tw@ \hskip \tw@\arraycolsep
         $\displaystyle{##}$\hfil\tabskip\@centering
      &\global\@eqcnt\thr@@ \hb@xt@\z@\bgroup\hss$\displaystyle{##}$\egroup
         \tabskip\z@skip
      \cr
}
\def\endeqnarray{%
      \@@eqncr
      \egroup
      \global\advance\c@equation\m@ne
   $$\@ignoretrue
}

\renewcommand{\.}{\raisebox{.9mm}{.}}

\endinput
