---
name: quarto-editing
description: QMD/Quartoプロジェクトの日本語環境設定とフォーマット修正
---

# Quarto Editing Skill

このスキルは、日本語を含むQuartoプロジェクト（.qmd, _quarto.yml）を適切に設定し、フォーマットを修正するためのガイドラインです。

## 1. プロジェクト設定 (_quarto.yml)

日本語を含む書籍やレポートを作成する場合、以下の設定を推奨します。

### 出力フォーマットとフォントデバイス
HTML、PDF、DOCXのそれぞれで最適なグラフィックスデバイスが異なります。

```yaml
format:
  html:
    knitr:
      opts_chunk:
        dev: "ragg_png"  # HTML用: システムフォントを正しく扱う (ragg必須)
  pdf:
    pdf-engine: lualatex
    documentclass: ltjsbook  # 書籍（chapterあり）の場合
    classoption: lualatex,ja=standard
    knitr:
      opts_chunk:
        dev: "cairo_pdf" # PDF用: フォントを埋め込む
  docx:
    knitr:
      opts_chunk:
        dev: "ragg_png"  # DOCX用: デフォルトだと文字化けするためragg_pngを指定
```

**注意**: `ltjsarticle` は `\chapter` コマンドをサポートしていないため、書籍形式の場合は必ず `ltjsbook` を使用してください。

## 2. Rコード内のフォント設定 (.qmd)

グラフ描画時の日本語フォント設定は、OSに合わせて適切に行ってください。
Macユーザーの場合、`ggplot2` のテーマ設定で以下のように指定すると安定します。

```r
library(tidyverse)
# Mac用ヒラギノフォント設定
theme_set(theme_gray(base_family = "HiraKakuProN-W3"))
```

## 3. コンテンツのフォーマット修正

### 見出しとLaTeX数式
PDF出力（特に目次生成時）において、見出し（`#`, `##`）の中にLaTeX数式（`$x$`など）を含めるとコンパイルエラーになることがあります。
**原則として、見出しには数式を含めず、言葉で表現してください。**

- Bad: `## 決定係数 ($R^2$) の意味`
- Good: `## 決定係数の意味`

### リスト前の改行ルール
Markdownリスト（`*`, `-`, `+`, `1.`）の直前には、必ず空行を入れてください（見出しの直後を除く）。
これにより、レンダリング時の崩れを防ぎます。

- Bad:
  ```markdown
  本文です
  - リスト1
  ```
- Good:
  ```markdown
  本文です

  - リスト1
  ```

## 4. トラブルシューティング

*   **HTMLで画像が表示されない（プラグインエラー）**: PDF用の `cairo_pdf` がHTML出力にも適用されていないか確認してください。HTMLには `ragg_png` が推奨されます。
*   **DOCXで文字化け（豆腐化）する**: DOCX出力の設定にも明示的に `dev: "ragg_png"` を追加してください。デフォルトデバイスでは日本語フォントが正しく読み込まれないことがあります。
*   **PDF生成エラー "Undefined control sequence"**: `ltjsarticle` クラスを使用していませんか？書籍形式（`\chapter`コマンド使用）の場合は `ltjsbook` に変更してください。

## 5. 実行手順
このスキルを使用する際は、以下のチェックを行ってください。
1. `_quarto.yml`: `dev` 設定（HTML: `ragg_png`, PDF: `cairo_pdf`, DOCX: `ragg_png`）の確認。
2. `.qmd`: 見出し内の数式削除。
3. `.qmd`: リスト前の空行挿入。

