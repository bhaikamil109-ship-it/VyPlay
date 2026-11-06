package org.schabi.newpipe.streams.io;

import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;

/**
 * Based on C#'s Stream class. It has both input and output like in C#, while in Java those are
 * usually different classes.
 *
 * <p>Vendored from NewPipe 0.29.1 for VyPlay's native muxer. The upstream SAF-backed
 * implementations ({@code FileStreamSAF}, {@code FileStream}) and the {@code SharpInputStream} /
 * {@code SharpOutputStream} adapters are not vendored: VyPlay's downloads always land in the app's
 * own directory, so the muxer supplies a plain random-access file stream instead.
 */
public abstract class SharpStream implements Closeable, Flushable {
    public abstract int read() throws IOException;

    public abstract int read(byte[] buffer) throws IOException;

    public abstract int read(byte[] buffer, int offset, int count) throws IOException;

    public abstract long skip(long amount) throws IOException;

    public abstract long available();

    public abstract void rewind() throws IOException;

    public abstract boolean isClosed();

    @Override
    public abstract void close();

    public abstract boolean canRewind();

    public abstract boolean canRead();

    public abstract boolean canWrite();

    public boolean canSetLength() {
        return false;
    }

    public boolean canSeek() {
        return false;
    }

    public abstract void write(byte value) throws IOException;

    public abstract void write(byte[] buffer) throws IOException;

    public abstract void write(byte[] buffer, int offset, int count) throws IOException;

    public void flush() throws IOException {
        // STUB
    }

    public void setLength(final long length) throws IOException {
        throw new IOException("Not implemented");
    }

    public void seek(final long offset) throws IOException {
        throw new IOException("Not implemented");
    }

    public long length() throws IOException {
        throw new UnsupportedOperationException("Unsupported operation");
    }
}
