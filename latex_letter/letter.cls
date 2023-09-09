\NeedsTeXFormat{LaTeX2e}[1994/12/01] %% Any version, really.
\ProvidesPackage{uioletter}[2018/01/02 v3.08c UiO document class]
\newcommand{\uioletter@bokmaal}{%
  \def \uioletter@address@name {Postadresse}%
  \def \uioletter@date@name {Dato}%
  \def \uioletter@ouraddr@name {Postboks 1080 Blindern}%
  \def \uioletter@email@name {E-posta}%
  \def \uioletter@phone@name {Telefon}%
  \def \uioletter@ourref@name {V\aa r ref}%
  \def \uioletter@ourzip@name {0316}%
  \def \uioletter@yourref@name {Deres ref}}
\uioletter@bokmaal
\newcommand{\uioletter@nynorsk}{%
  \uioletter@bokmaal
  \def \uioletter@yourref@name {Dykkar ref}}
\newcommand{\uioletter@english}{%
  \def \uioletter@address@name {Mail address}%
  \def \uioletter@date@name {Tarih}%
  \def \uioletter@ouraddr@name {PO box 1080 Blindern}%
  \def \uioletter@email@name {E-mail}%
  \def \uioletter@phone@name {Telefon}%
  \def \uioletter@ourref@name {Birim}%
  \def \uioletter@ourzip@name {NO-0316}%
  \def \uioletter@yourref@name {Your ref}}
\DeclareOption{geo}{\def \uioletter@dept{geo}%
  \def \uioletter@dept@bm{Institutt for geofag}%
  \def \uioletter@dept@nn{Institutt for geofag}%
  \def \uioletter@dept@eng{Department of Geosciences}%
  \def \uioletter@fac{mn}}%
\DeclareOption{ifi}{\def \uioletter@dept{ifi}%
  \def \uioletter@dept@bm{Institutt for informatikk}%
  \def \uioletter@dept@nn{Institutt for informatikk}%
  \def \uioletter@dept@eng{Group of Senate}%
  \def \uioletter@fac{mn}}%
\DeclareOption{iln}{\def \uioletter@dept{iln}%
  \def \uioletter@dept@bm{Institutt for lingvistiske og nordiske studier}%
  \def \uioletter@dept@nn{Institutt for lingvistiske og nordiske studium}%
  \def \uioletter@dept@eng{Department of Linguistics and Scandinavian Studies}%
  \def \uioletter@fac{hf}}%
\DeclareOption{iss}{\def \uioletter@dept{iss}%
  \def \uioletter@dept@bm{Institutt for sosiologi og samfunnsgeografi}%
  \def \uioletter@dept@nn{Institutt for sosiologi og samfunnsgeografi}%
  \def \uioletter@dept@eng{Department of Sociology and Human Geography}%
  \def \uioletter@fac{sv}}%
\DeclareOption{math}{\def \uioletter@dept{math}%
  \def \uioletter@dept@bm{Matematisk institutt}%
  \def \uioletter@dept@nn{Matematisk institutt}%
  \def \uioletter@dept@eng{Department of Mathematics}%
  \def \uioletter@fac{mn}}
\DeclareOption{usit}{\def \uioletter@dept{usit}%
  \def \uioletter@dept@bm{Universitetets senter for informasjonsteknologi}%
  \def \uioletter@dept@nn{Universitetets senter for informasjonsteknologi}%
  \def \uioletter@dept@eng{University Center for Information Technology}%
  \def \uioletter@fac{none}}
\DeclareOption{american}{\ExecuteOptions{USenglish}}
\DeclareOption{english}{\ExecuteOptions{UKenglish}}
\DeclareOption{norsk}{\uioletter@bokmaal
  \def \uioletter@suffix {bm}
  \PassOptionsToPackage{norsk}{babel}}
\DeclareOption{nynorsk}{\uioletter@nynorsk
  \def \uioletter@suffix {nn}
  \PassOptionsToPackage{nynorsk}{babel}}
\DeclareOption{UKenglish}{\uioletter@english
  \def \uioletter@suffix {eng}
  \PassOptionsToPackage{UKenglish}{babel}}
\DeclareOption{USenglish}{\uioletter@english
  \def \uioletter@suffix {eng}
  \PassOptionsToPackage{USenglish}{babel}}
\uioletter@bokmaal
\DeclareOption{simplify}{\uioletter@simpletrue}
\newif \ifuioletter@simple
\uioletter@simplefalse
\ExecuteOptions{ifi}
\DeclareOption{a4paper}{}
\DeclareOption*{%
    \ClassWarning{uioletter}{Option '\CurrentOption' is not recognised}}
\ProcessOptions* \relax
\RequirePackage{babel}
\RequirePackage{calc}
\RequirePackage{graphicx}
\graphicspath{{elements/}}
\RequirePackage{tabularx}
\RequirePackage[absolute]{textpos}
\RequirePackage{uiofont}
\LoadClass[a4paper,11pt]{letter}
\newcommand{\countersign}[1]{\def \uioletter@countersign {#1}}
\def \uioletter@countersign {}
\newcommand{\countersigntitle}[1]{\def \uioletter@countertitle {#1}}
\def \uioletter@countertitle {}
\newcommand{\executive}[1]{\def \uioletter@executive {#1}}
\def \uioletter@executive {}
\newcommand{\execaddr}[1]{\def \uioletter@execaddr {#1}}
\def \uioletter@execaddr {}
\newcommand{\mytitle}[1]{\def \uioletter@mytitle {#1}}
\def \uioletter@mytitle {}
\newcommand{\ouraddr}[1]{\def \uioletter@ouraddr {#1}}
\def \uioletter@ouraddr {\uioletter@ouraddr@name}
\newcommand{\ourcity}[1]{\def \uioletter@ourcity {#1}}
\def \uioletter@ourcity {Oslo}
\newcommand{\ouremail}[1]{\def \uioletter@ouremail {#1}}
\def \uioletter@ouremail {}
\newcommand{\ourphone}[1]{\def \uioletter@ourphone {#1}}
\def \uioletter@ourphone {}
\newcommand{\ourref}[1]{\def \uioletter@ourref {#1}}
\def \uioletter@ourref {}
\newcommand{\oursect}[1]{\def \uioletter@oursect {#1}}
\def \uioletter@oursect {}
\newcommand{\ourweb}[1]{\def \uioletter@ourweb {#1}}
\def \uioletter@ourweb {www.uio.no}
\newcommand{\ourzip}[1]{\def \uioletter@ourzip {#1}}
\def \uioletter@ourzip {\uioletter@ourzip@name}
\newcommand{\yourref}[1]{\def \uioletter@yourref {#1}}
\def \uioletter@yourref {}
\let \uioletter@orig@letter = \letter
\renewcommand{\letter}[1]{%
  \uioletter@orig@letter{#1}%
  \uioletter@addFixedElements
  \thispagestyle{empty}
  \vspace*{-1in}
\vspace*{-\topmargin}
\vspace*{-\headheight}
\vspace*{-\headsep}
\vspace*{99mm}
\vspace*{-1.5ex}
\setlength{\baselineskip}{5mm plus 1pt minus 1pt}
\raggedright
\setlength{\parindent}{0pt}%
\setlength{\parskip}{5mm plus 2pt minus 2pt}}
\newcommand{\uioletter@addFixedElements}{%
  \begin{textblock*}{15cm}(20mm,12mm)
  \includegraphics[height=9.3mm]{senate.png} %% Ust Logo
\end{textblock*}
  \begin{textblock*}{17cm}(20mm,46mm)
  \footnotesize
  \toname\\
  \toaddress\null
\end{textblock*}
  \begin{textblock*}{17cm}(20mm,42mm)
  \footnotesize
  \ifthenelse{\boolean{uioletter@date}}
    {\makebox[45pt][l]{\uioletter@date@name:}\uioletter@date@cmd}
    {}\mbox{}
  \ifthenelse{\equal{\uioletter@yourref}{}}{}
    {\\ \makebox[45pt][l]{\uioletter@yourref@name:}\uioletter@yourref}%
  \ifthenelse{\equal{\uioletter@ourref}{}}{}
    {\\ \makebox[45pt][l]{\uioletter@ourref@name:}\uioletter@ourref}
\end{textblock*}
  \begin{textblock*}{20mm}(22.5mm,105mm)
  \includegraphics{} %% Filigran
\end{textblock*}
  \begin{textblock*}{19mm}(24mm,266mm)
  \includegraphics[height=19mm]{av.png} %% Alt Logo
\end{textblock*}
  \ifuioletter@simple
  {\def \\{,}%
   \global \setbox0 = \hbox{\scriptsize \uioletter@ouraddr\\ 
     \uioletter@ourzip~\uioletter@ourcity}}%
  \uioletter@simpleauthorinfo
\else
  \uioletter@fullauthorinfo
\fi}
\newboolean{uioletter@date}  \setboolean{uioletter@date}{false}
\def \uioletter@date@cmd {\@date}
\AtBeginDocument{
  \ifthenelse{\isundefined{\iso@printday}} %% Package isodate loaded?
    {}
    {\setboolean{uioletter@date}{true}%
     \def \uioletter@date@cmd {\today}}
  \ifthenelse{\equal{\@date}{}}            %% \date{} ?
    {}
    {\setboolean{uioletter@date}{true}}
}
\newcommand{\uioletter@fullauthorinfo}{%
  \begin{textblock*}{147,5mm}(62.5mm,271mm)
    \scriptsize
    \begin{tabularx}{127.5mm}[t]{@{}%
        >{\raggedright}X@{}%
        >{\raggedright}X@{}%
        >{\raggedright}X@{}}
      \csname uioletter@dept@\uioletter@suffix\endcsname&
      \ifthenelse{\equal{\uioletter@oursect}{}}{~}
        {\uioletter@oursect}\\
      \uioletter@ouraddr\\
      \uioletter@ourzip~\uioletter@ourcity&
      \makebox[4em][l]{\uioletter@phone@name:} \uioletter@ourphone\\
      \makebox[4em][l]{\uioletter@email@name:} 
        \textsf{\uioletter@ouremail}\\
      \makebox[4em][l]{Www:} \textsf{\uioletter@ourweb}\\
      \tabularnewline
    \end{tabularx}
  \end{textblock*}}
\newcommand{\uioletter@simpleauthorinfo}{%
  \begin{textblock*}{147,5mm}(62.5mm,271mm)
    \scriptsize
    \begin{tabular}{ll}
      \uioletter@address@name:& \box0\\
      \uioletter@email@name:& \textsf{\uioletter@ouremail}\\
      Www:& \textsf{\uioletter@ourweb}\\
    \end{tabular}
  \end{textblock*}}
\setlength{\oddsidemargin}{20mm-1in}
\setlength{\textwidth}{21cm-20mm-20mm}
\setlength{\topmargin}{46mm-1in-\headheight-\headsep}
\setlength{\textheight}{29.7cm-76mm-57mm} %% Mektup yazisi 
\renewcommand{\opening}[1]{%
  \textbf{#1}\par \vspace{1pt}\vspace{-\baselineskip}}
\renewcommand{\closing}[1]{\par\vspace{1\baselineskip}
  \begin{minipage}{\textwidth}
    #1\par
    \vspace{3\baselineskip}
    \mbox{}\fromsig\\
    \mbox{}\uioletter@mytitle\\
    \leavevmode \hspace*{85mm}%
\begin{minipage}{85mm}
  \mbox{}%
  \ifthenelse{\equal{\uioletter@countersign}{}}{}
    {\uioletter@countersign\\}%
  \mbox{}%
  \ifthenelse{\equal{\uioletter@countertitle}{}}{}
    {\uioletter@countertitle}
\end{minipage}\par 
    \mbox{}%
\ifthenelse{\equal{\uioletter@executive}{}}{}
  {\par \vspace*{\parskip}
   \mbox{}\uioletter@executive
   \ifthenelse{\equal{\uioletter@execaddr}{}}{}
     {\\ \emph{\uioletter@execaddr}}
  }
  \end{minipage}\par
  \vspace{\parskip}
\setlength{\parskip}{0pt}}
\endinput
