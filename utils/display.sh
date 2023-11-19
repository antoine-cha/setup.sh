function announce() {
    # Surround text with 15 equal signs
    SPACES=$(printf %15s |tr " " "=")
    echo -e "$SPACES $@ $SPACES"
}