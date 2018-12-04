## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(stringr)

emoji_text <- data.frame(text = c("I’m so hungry 😩 and my stomach hurts!",
                                  "I am super excited to go on vacation with my family 🌸🌊🏄🏽",
                                  "My mom is making me eat my vegetables. 🥦🤢😡😭 I wish I could eat ice cream all day! 🍦",
                                  "I have to go to bed now! 😴 Good night!😘😍💕",
                                  "I have to go to bed now! 😔 Good night!😠😠😠"),
                         stringsAsFactors = FALSE)

## ------------------------------------------------------------------------
# examine text column
head(emoji_text$text)

## ------------------------------------------------------------------------
# convert emojis to text
# REPLACE WITH LIBRARY WITH QACSTAT
library(qacEmoji)
emoji_text$clean_text <- emojitotext(emoji_text$text)

## ------------------------------------------------------------------------
library(syuzhet)
emoji_text$sentiment <- get_sentiment(emoji_text$clean_text, method = "afinn")

## ---- echo = FALSE-------------------------------------------------------
library(formattable)
formattable(emoji_text,
            align = c("l", "l", "r"),
            list(sentiment = formatter("span",
                                       style = function(x) ifelse(x > 0,
                                                                  "color:green", "color:red"))))

