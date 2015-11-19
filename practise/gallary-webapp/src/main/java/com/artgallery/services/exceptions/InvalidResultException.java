package com.artgallery.services.exceptions;

public class InvalidResultException extends Exception {
  Exception sourceException = null;

  public InvalidResultException(Exception sourceException) {
    this.sourceException = sourceException;
  }

  public Exception getSourceException() {
    return sourceException;
  }
}
