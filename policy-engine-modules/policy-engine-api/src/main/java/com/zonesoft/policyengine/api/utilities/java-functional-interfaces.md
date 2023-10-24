A functional interface is an interface with a single abstract method (SAM)

```
public interface Comparator<T> {
    int compare(T o1, T o2);
}

public interface Callable<V> {
    V call() throws Exception;
}

public interface ActionListener extends EventListener {
    public void actionPerformed(ActionEvent e);
}

public interface Runnable {
    public void run();
}

public interface Predicate<T> {
    boolean test(T t);
}

public interface Function<T,R> {
    R apply(T t);
}

public interface BinaryOperator<T> {
    T apply(T left, T right);
}

public interface Consumer<T> {
    void accept(T t);
}

public interface Supplier<T> {
    T get();
}
```