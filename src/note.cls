\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classnote}[2021/10/21]

% ------------------------------ Based on article class ---------------- %
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
% ---------------------------------------------------------------------- %

% ------------------------------ Footnote ------------------------------ %
\RequirePackage[symbol]{footmisc}
% ---------------------------------------------------------------------- %

% ------------------------------ Font ---------------------------------- %
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\newcommand*{\myliningnumfont}{\fontfamily{ppl}\selectfont}
% ---------------------------------------------------------------------- %

% ------------------------------ Math ---------------------------------- %
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{relsize}
\newcommand\bmmax{0}
\RequirePackage{bm}
\RequirePackage{amssymb}
\RequirePackage{textcomp} % Needed for symbols such as degrees, copyright, etc.
\RequirePackage[gen]{eurosym}
% ---------------------------------------------------------------------- %

% ------------------------------ Font (2) ------------------------------ %
\linespread{1.11}
% ---------------------------------------------------------------------- %

% ------------------------------ Geometry ------------------------------ %
\RequirePackage{adjustbox}
\RequirePackage[letterpaper,
      top=1in,
      bottom=1in,
      left=1in,
      right=3in,marginparwidth=2in,marginparsep=0.15in,asymmetric,ignoremp]{geometry}

% Avoid large gaps between paragraphs: Now not all pages have the same height
\raggedbottom
% ---------------------------------------------------------------------- %

% ------------------------------ Figures ------------------------------- %
% \RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{epstopdf}
% \RequirePackage[position=top]{subfig}
\RequirePackage{subfig}
\RequirePackage{caption}
\captionsetup[figure]{labelfont={footnotesize,rm,bf},font={footnotesize,rm},%
                      justification=RaggedRight,%
                      singlelinecheck=false}
\captionsetup[table]{labelfont={footnotesize,rm,bf},font={footnotesize,rm},%
                     justification=RaggedRight,%
                     singlelinecheck=false,%
                     position=bottom}
% \captionsetup[subfloat]{farskip=-10pt,nearskip=-100pt,captionskip=0pt}
\let\newfloat\undefined
\RequirePackage{placeins}
\RequirePackage{sidenotes}

\newcounter{mparcnt}
\renewcommand\themparcnt{\fnsymbol{mparcnt}}
\newcommand\snote[1]{\refstepcounter{mparcnt}\textsuperscript{\themparcnt}\marginpar{\raggedright\footnotesize\textsuperscript{\themparcnt}\, #1}}

\newcounter{mthankscnt}
\renewcommand\themthankscnt{\fnsymbol{mthankscnt}}
\renewcommand\thanks[1]{\refstepcounter{mthankscnt}\textsuperscript{\themthankscnt}\marginpar{\raggedright\footnotesize\themthankscnt #1}}

\DeclareCaptionStyle{sidecaption}{labelfont={footnotesize,rm,bf},
                                  font={footnotesize,rm},position=bottom,
                                  justification=raggedright}
\DeclareCaptionStyle{marginfigure}{labelfont={footnotesize,rm,bf},font={footnotesize,rm},%
                            justification=RaggedRight,%
                            singlelinecheck=false}
% \setlength{\belowcaptionskip}{0pt}
% \setlength{\textfloatsep}{5.7pt}
% \RequirePackage{floatrow}
% \floatsetup{margins=hangright,capposition=beside,
%   capbesideposition={bottom,right},floatwidth=\textwidth}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}
\setlength{\textfloatsep}{10pt}% plus 0.0pt minus 0.0pt}
\setlength{\intextsep}{10pt}% plus 0.0pt minus 0.0pt}
\setlength{\floatsep}{0pt}% plus 0.0pt minus 0.0pt}
% ---------------------------------------------------------------------- %


% ------------------------------ In-document referencing --------------- %
\RequirePackage[hypertexnames=false,hidelinks]{hyperref}%  hyperlinks [must be loaded after dropping]
\RequirePackage{cleveref}%  smart page, figure, table, and equation referencing
\RequirePackage[all]{hypcap} % Makes sure hyperref points to beginning of
                         % the float, not the caption
% cref
\crefname{equation}{Eq.}{Equations}
\Crefname{equation}{Eq.}{Equations}
\crefname{figure}{Fig.}{Figures}
\Crefname{figure}{Fig.}{Figures}
\crefname{table}{Table}{Tables}
\Crefname{table}{Table}{Tables}
\crefname{chapter}{Chapter}{Chapters}
\Crefname{chapter}{Chapter}{Chapters}
\crefname{appendix}{Appendix}{Appendices}
\Crefname{appendix}{Appendix}{Appendices}
\crefname{section}{Section}{Sections}
\Crefname{section}{Section}{Sections}
\crefname{algorithm}{Algorithm}{Algorithms}
\Crefname{algorithm}{Algorithm}{Algorithms}
\crefname{appchap}{Appendix}{Appendices}
\Crefname{appchap}{Appendix}{Appendices}

\urlstyle{same}

% Use lining number in equation numbers
% \makeatletter
% \let\refgform@=\gform@
% \def\gform@#1{\makeg@@@{(\ignorespaces{#1}\unskip\@@italiccorr)}}
% \renewcommand{\eqref}[1]{\textup{\refgform@{\ref{#1}}}}
% \makeatother
% ---------------------------------------------------------------------- %

% ------------------------------ Section format ------------------------ %
\RequirePackage{titlesec}

\titleformat{\section}
     {\relax}{\large\bfseries\thesection}{1em}{\large\bfseries}

\titleformat{\subsection}
     {\relax}{\bfseries\thesubsection}{1em}{\bfseries}
% ---------------------------------------------------------------------- %

% ------------------------------ Full figure --------------------------- %
\newlength\fullwidth\fullwidth=\textwidth
\advance\fullwidth by \marginparwidth
\advance\fullwidth by \marginparsep

\newcounter{fullfigcnt}

% \newenvironment{fullfigure}[1][]
%   {\begin{figure}[#1]%
%     % \floatsetup{margins=hangright,capposition=bottom,
%     %   capbesideposition={bottom,right},floatwidth=\textwidth}
%       \ifthenelse{\isodd{\pageref{fullfigs:\thefullfigcnt}}}%
%       {\begin{adjustwidth}{-\marginextra}{0cm}}%
%       {\begin{adjustwidth}{0cm}{-\marginextra}}%
%   }%
%   {\end{adjustwidth}%
%     \label{fullfigs:\thefullfigcnt}\end{figure}\stepcounter{fullfigcnt}}
% ---------------------------------------------------------------------- %

% ------------------------------ Tikz ---------------------------------- %
\RequirePackage{tikz,pgfplots}
\usetikzlibrary{arrows,shapes,positioning,shadows,trees,patterns,intersections,matrix,fit,backgrounds}
\pgfplotsset{compat=newest}
\usepackage{standalone}
  \pgfplotsset{plot coordinates/math parser=false}
\newlength\figureheight
    \newlength\figurewidth
\RequirePackage{tikz-3dplot}
\RequirePackage{tkz-euclide}
\tikzset{
  basic box/.style={
    shape=rectangle, rounded corners, align=center,
    draw=#1, fill=#1!25},
}
\RequirePackage{xcolor}
% ---------------------------------------------------------------------- %

% ------------------------------ Colors -------------------------------- %
\definecolor{MITred}{RGB}{163, 31, 52} % #a31f34
\definecolor{MITdg}{RGB}{138, 139, 140}
\definecolor{MITlg}{RGB}{194, 192, 191}
\definecolor{AAblue}{RGB}{0, 23, 63}
\definecolor{AAgray}{RGB}{123, 118, 117}
\definecolor{AAlb}{RGB}{0, 135, 188}
\definecolor{AAMITmix}{RGB}{82, 27, 58}

\definecolor{red}{HTML}{AD1737}
\definecolor{brown}{HTML}{990000}
\definecolor{bar}{HTML}{8D9965}

\definecolor{AAblue2}{RGB}{0, 71, 117} % #004775
% ---------------------------------------------------------------------- %

% ------------------------------ Tables -------------------------------- %
\RequirePackage{tabularx}
\RequirePackage{booktabs,colortbl}
\RequirePackage{array}
\RequirePackage{hhline}
% ---------------------------------------------------------------------- %

% ------------------------------ Indexing ------------------------------ %
\RequirePackage{multicol}
\RequirePackage{imakeidx}            % Alphabetical Index
\RequirePackage{nomencl}
\RequirePackage{etoolbox,ragged2e,mathtools} % Nomenclature
\RequirePackage[toc,acronym]{glossaries} % List of acronyms and glossary
%\makeindex[columns=2, title=Alphabetical Index, intoc]
% \renewcommand*{\nomgroup}{}
\renewcommand{\nomname}{Nomenclature}
%\renewcommand*{\nompreamble}{\begin{multicols}{2} \markboth{\nomname}{\nomname}}
%\renewcommand*\nompostamble{\end{multicols}}
\setlength{\nomitemsep}{-\parsep}
% ---------------------------------------------------------------------- %

% ------------------------------ New variables ------------------------- %
\def\conf#1{\gdef\@conf{#1}\gdef\THECONF{#1}}
\def\institute#1{\gdef\@institute{#1}\gdef\THEINSTITUTE{#1}}
\def\keywords#1{\gdef\@keywords{#1}\gdef\THEKEYWORDS{#1}}
% ---------------------------------------------------------------------- %

% ------------------------------ Titles -------------------------------- %
\newcounter{abstract@cthanks}
\newcounter{abstract@cfootnote}
\newcommand{\thanksibid}[1]{%
  \begingroup
    \setcounter{abstract@cfootnote}{\value{footnote}}% store original
    \setcounter{abstract@cthanks}{#1}%
    \renewcommand\thefootnote{\fnsymbol{abstract@cthanks}}%
    \footnotemark%
    \setcounter{footnote}{\value{abstract@cfootnote}}% reset to original
  \endgroup
}
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \newpage
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \@maketitle
    \@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \renewcommand\thefootnote{\@alph\c@footnote}% change to alpha style footnote
  \global\let\thanks\relax
  \global\let\thanksibid\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@institute\@empty
  \global\let\@keywords\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\institute\relax
  \global\let\keywords\relax
  \global\let\and\relax
}
\def\@maketitle{%
  \newpage%
    {\LARGE\bfseries\noindent\raggedright\@title\par}%
    \vskip 1.5em%
    {\large\noindent\@author\par}%
    \vskip 0.75em%
    {\small\noindent\@date\par}%
  % \par%
  % \vskip 1.0em%
  % {\noindent\@institute\par}%
  \vskip 1.5em%
  }

% ---------------------------------------------------------------------- %

% ------------------------------ Pagestyle ----------------------------- %
\RequirePackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\fancypagestyle{mainmatter}{
      \fancyfoot[LO,RE]{\small \thepage}
      \fancyfoot[RO,LE]{\footnotesize \newtitle}
	\fancyhead[LRC]{}
	\fancyfoot[C]{}
}
% \fancypagestyle{frontpage}{
%       \fancyfoot[L]{\small \thepage}
%       \fancyfoot[RC]{}
%     	\fancyhead[LRC]{}
% }
% ---------------------------------------------------------------------- %
% this could be useful https://tex.stackexchange.com/questions/238661/is-it-possible-to-fine-tune-the-citation-positions-in-tufte-biblatex-combination
% ------------------------------ Bibliography -------------------------- %
\RequirePackage{marginfix}

% \DeclareFieldFormat{sidecite}{\marginpar{\linespread{1.05}\scriptsize#1}}
% \newbibmacro{sidecite}{%
%   \printtext[sidecite]{%
%     \RaggedRight%\scriptsize%
%     \printtext[bibhyperref]{\printfield{labelnumber}.}
%     \textcolor{gray}{%
%     \printnames{labelname}%
%     \unspace, %
%     %\setunit{\printdelim{nametitledelim}}%
%     %\printfield[citetitle]{labeltitle}%
%     \iffieldundef{doi}{%
%       \iffieldundef{isbn}{%
%         \iffieldundef{url}{%
%           \ifentrytype{patent}{%
%             \href{https://patents.google.com/patent/US\thefield{number}/en}{\printfield[citetitle]{labeltitle}}%
%           }{%
%             \printfield[citetitle]{labeltitle}%
%           }%
%         }{% if only url is available
%           \href{https://\thefield{url}}{\printfield[citetitle]{labeltitle}}%
%         }%
%         %\printfield[citetitle]{labeltitle}%
%       }{% if only url or isbn is available
%         \href{https://books.google.com/books?vid=ISBN\thefield{isbn}}{\printfield[citetitle]{labeltitle}}%
%       }%
%     }%
%     {%
%       \href{https://dx.doi.org/\thefield{doi}}{\printfield[citetitle]{labeltitle}}%
%     }%
%     \setunit{\addperiod\space}%
%     \printfield{year}%
%     }%
%     }%
%   \setunit{}}

% \makeatletter
% %%%% hack to move punctuation like autocite
% \long\def\blx@defcitecmd@iii#1[#2]{%
%   \protected\long\csedef{blx@cite@#1}##1##2##3##4{%
%     \begingroup
%     \blx@citeinit
%     \ifstrequal{#1}{superpluscite}{\noexpand\unspace##4}{}%
%     \unexpanded{#2}{\blxciteicmd{#1}{##1}{##2}{##3}{}}%
%     \ifstrequal{#1}{superpluscite}{}{##4}\endgroup}%
%   \blx@defcitecmd@iv{#1}}
% %%%% hack end

% \DeclareCiteCommand{\cbx@mcite}[\mkbibsuperscript]
%   {%\usebibmacro{cite:init}%
%    \let\multicitedelim=\supercitedelim
%    \iffieldundef{prenote}
%      {}
%      {\BibliographyWarning{Ignoring prenote argument}}%
%    \iffieldundef{postnote}
%      {}
%      {\BibliographyWarning{Ignoring postnote argument}}%
%    }
%   {\usebibmacro{citeindex}%
%    \usebibmacro{cite:comp}}
%   {}
%   {\usebibmacro{cite:dump}}

% \DeclareCiteCommand{\mcite}[\cbx@mcite@init\cbx@mcite]
%   {\gdef\cbx@savedkeys{}%
%    \citetrackerfalse%
%    \pagetrackerfalse%
%    \DeferNextCitekeyHook%
%    %\usebibmacro{cite:init}%
%    }
%   {\xappto\cbx@savedkeys{\thefield{entrykey},}%
%    \usebibmacro{sidecite}}
%   {}
%   {\protected@xappto\cbx@savedcites{{\cbx@savedkeys}}}

% \newrobustcmd{\cbx@mcite@init}[2]{%
%   \def\cbx@savedcites{#1}#2\cbx@savedcites\empty}
% \makeatother

% \DeclareCiteCommand{\mciten} % only prints number and puts reference in margin
%   {}
%   {\printtext[bibhyperref]{\printfield{labelnumber}}%
%    \usebibmacro{sidecite}}
%   {}
%   {}
% \DeclareCiteCommand{\citen} % only prints number, but not in margin (useful for figures)
%   {}
%   {\printtext[bibhyperref]{\printfield{labelnumber}}}
%   {}
%   {}

% \DeclareCiteCommand{\mnocite} % only prints number and puts reference in margin
%   {}
%   {\usebibmacro{sidecite}}
%   {}
%   {}

% ---------------------------------------------------------------------- %

% \hypersetup{
%   pdfinfo={
%     Title={\@title},
%     Author={\@author},
%     Keywords={\@keywords}
%   }
% }

% ============================== Add extra commands ==================== %
% ------------------------------ Partials ------------------------------ %
\newcommand{\PDer}[2]{%
    \frac{\partial #1}{\partial #2}
}
\newcommand{\PDerT}[2]{%
    \frac{\partial^2 #1}{\partial #2^2}
}
\newcommand{\PDerF}[2]{%
    \frac{\partial^4 #1}{\partial #2^4}
}
\newcommand{\PDerFM}[3]{%
    \frac{\partial^4 #1}{\partial #2^2 \partial #3^2}
}
\newcommand{\PDerTh}[2]{%
    \frac{\partial^3 #1}{\partial #2^3}
}
\newcommand{\PDerThM}[3]{%
    \frac{\partial^3 #1}{\partial #2 \partial #3}
}

\newcommand{\PDerM}[3]{%
    \frac{\partial^2 #1}{\partial #2 \partial #3}
}
\newcommand{\DerF}[2]{%
    \frac{\mathrm{d}^4 #1}{\mathrm{d} #2^4}
}
\newcommand{\Der}[2]{%
    \frac{\mathrm{d} #1}{\mathrm{d} #2}
}
\newcommand{\DerT}[2]{%
    \frac{\mathrm{d}^2 #1}{\mathrm{d} #2^2}
}
\newcommand{\DerTh}[2]{%
    \frac{\mathrm{d}^3 #1}{\mathrm{d} #2^3}
}
% ---------------------------------------------------------------------- %
% ====================================================================== %
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
