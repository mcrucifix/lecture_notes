\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mc}[2014/08/16 Example LaTeX class]
 
\newcommand{\headlinecolor}{\normalcolor}
\LoadClass{article}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\usepackage{mathtools}
\usepackage{bm}
\usepackage{hyperref}
 
\RequirePackage{tikz}
\RequirePackage{calc}
\RequirePackage{ifthen}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
 
\geometry{paper=a5paper,landscape}

\newlength\bl
\setlength\bl\baselineskip
\renewcommand{\normalsize}{\fontsize{14}{16}\selectfont}
\newcommand{\topbox}[1]{\raisebox{.5\bl-\height}{#1}}
\newcommand{\ftopbox}[1]{\framebox{\topbox{{#1}}}}
\setcounter{secnumdepth}{3}
\def\minus{%
  \setbox0=\hbox{-}%
  \vcenter{%
    \hrule width\wd0 height \the\fontdimen8\textfont3%
  }%
}

\newcommand\rbox[1]{{%
\setlength\parfillskip{0pt}%
\hrulefill
\makebox[0pt]{#1}%
\hrulefill
\par
\bigskip}}
\setlength\parindent{0pt}
%\newenvironment{sideimage}[1]{
%\begin{tabularx}{\textwidth}{@{}lX@{}|}
%  \topbox{#1}  &}{\end{minipage}\end{tabularx}}

%\DeclareMathOperator{\D}{D}
%\DeclareMathOperator{\dif}{d}
\newcommand{\Dif}{\mathop{}\!\mathrm{D}}
\newcommand{\dif}{\mathop{}\!\mathrm{d}}

\newcommand{\od}[3][]{
\ifthenelse{\equal{#1}{}}{
\frac{\dif #2}{\dif #3}}{
\frac{\dif^{#1} #2}{\dif #3^{#1}}}
}


\newcommand{\pd}[3][]{
\ifthenelse{\equal{#1}{}}{
\frac{\partial #2}{\partial #3}}
{\frac{\partial^{#1} #2}{\partial #3^{#1}}
}}

\newcommand{\eqdef}{\stackrel{\rm def}{=}}
%\renewcommand\vec[1]{\boldsymbol{#1}}

\makeatletter
\newcommand\mathsquared[2][black]{%
  \tikzstyle{mathbox}=[#1]
  \mathpalette\@mathsquared{#2}%
}
\newcommand\@mathsquared[2]{%
  \tikz[baseline=(math.base)] \node[draw,mathbox,inner sep=5pt] (math) {$\m@th#1#2$};%
}
\makeatother

\newcommand\exercice[1]{\medskip\framebox[\textwidth]{\parbox{0.98\textwidth}{{ \textbf{Exercice: }#1}}}}


