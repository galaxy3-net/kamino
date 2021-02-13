#!/usr/bin/env bash

stat "${G3HOME}/vagrant/kamino/kamino.box" && rm "${G3HOME}/vagrant/kamino/kamino.box"

vagrant package --base "Kamino (Kali) Build" --out "${G3HOME}/vagrant/kamino/kamino.box"