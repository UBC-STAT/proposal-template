% UBC Statistics proposal template
% Daniel J. McDonald 2024
% building on
% CMU Statistics & Data Science proposal and ADA report template
%   Alex Reinhart, 2022
% article

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ubcstatproposal}[2024/03/23 ubcstatproposal]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions

\LoadClass[12pt,letterpaper,twoside]{article}

% Math packages
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{lipsum}

% define theorem, corollary, lemma, and definition environments
\theoremstyle{plain}
\newtheorem*{theorem*}{Theorem}
\newtheorem{theorem}{Theorem}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{definition}[theorem]{Definition}

% Fonts
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern} % default to Latin Modern for better character support

% Typesetting options
\RequirePackage{microtype}
\RequirePackage[hyphens,obeyspaces]{url}
\RequirePackage{booktabs}

% Headers and footers
\RequirePackage{fancyhdr}

% Figure caption styles: sans-serif, with label "Figure N" italicized
% \RequirePackage[font=sf,labelfont=it]{caption}

% Provide a shorttitle command for page headings, in case their title is too
% long
\newcommand{\shorttitle}[1]{\def\@shorttitle{#1}}
\DeclareRobustCommand{\BibTeX}{%
  {\normalfont B\kern-.05em{\scshape i\kern-.025em b}\kern-.08em \TeX}%
}


% Note: Change to \RequirePackage[hidelinks,final]{hyperref} for printing in
% B&W, to avoid unsightly boxes
\RequirePackage[final]{hyperref}
\hypersetup{%
    bookmarksnumbered=true,
    pdftitle={\@title},
    pdfauthor={\@author},
    pdfsubject={Department of Statistics, The University of British Columbia},
    pdfpagelayout=SinglePage,
    bookmarksopen=False,
    colorlinks=true,
    linkcolor=Blue,
    urlcolor=Blue,
    citecolor=Cerulean
  }
\RequirePackage[capitalize,nameinlink]{cleveref}

% Make some colours available
\RequirePackage[dvipsnames]{xcolor}

\RequirePackage[final]{graphicx}
\graphicspath{ {figures/} } % specify the path where figures are located

% Bibliography
\RequirePackage{natbib}

\RequirePackage[margin=2.5cm]{geometry} % pass tells it not to mess with the layout
\setlength{\headheight}{15pt}
% PDF metadata
\AtBeginDocument{%
  
    % Page headers
  \pagestyle{fancy}
  \fancyhead{}

  \fancyhead[CE]{\textit{\@author}}
  \ifdefined\@shorttitle
    \fancyhead[CO]{\textit{\@shorttitle}}
  \else
    \fancyhead[CO]{\textit{\@title}}
  \fi

  

  \fancyhead[RE,RO]{\thepage}

  \renewcommand{\headrulewidth}{0pt}

  \ifdraft{
    \newcommand{\draftmark}{{\sffamily Draft as of \today}}
    \fancyfoot[CE,CO]{\draftmark}
  }{
    \fancyfoot{}
  }

  \thispagestyle{empty}
  
}

% Fancypants logic
\RequirePackage{pgffor}
\RequirePackage{ifdraft}

\def\theadvisors{}
\newcommand{\advisor}[1]{%
  \g@addto@macro\theadvisors{{#1},}
}
\def\thecommittee{}
\newcommand{\committee}[1]{%
  \g@addto@macro\thecommittee{{#1},}
}

\newcommand{\documenttype}[1]{\def\thedocumenttype{#1}}

\renewcommand{\maketitle}{%
  {
    \raggedright
    \begin{center}

      \vspace*{2.5cm}

      \includegraphics[width=3.5in]{ubc-logo-2018-wordmark-blue282-pms.pdf} \\
      {\Large Department of Statistics}\\[4ex]
      {\Large \thedocumenttype}\\[4ex]
      \ifdraft{\draftmark\\}{}

      \vspace{1cm}

      {\large \@title}\\[4ex]
      {\large  \@author}\\[4ex]
      \@date\\[8ex]
    \end{center}
    \vspace{1cm}

    \textbf{Committee:}\\
    % Advisor(s) first
    \foreach \advisor in \theadvisors {
      \ifx\advisor\empty
      \else
        \advisor, Advisor\\
      \fi
    }

    % Committee members
    \foreach \member in \thecommittee {
      \ifx\member\empty
      \else
        \member\\
      \fi
    }
    \clearpage
  }
}

% Support large landscape tables
\RequirePackage{pdflscape}
\newenvironment{landscapepage}[1][1in]{%
  \newgeometry{margin=#1}%
  \begin{landscape}}{%
  \end{landscape}%
  \restoregeometry}

