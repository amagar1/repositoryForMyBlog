package com.org.coop.retail.entities;

import static com.mysema.query.types.PathMetadataFactory.*;

import com.mysema.query.types.path.*;

import com.mysema.query.types.PathMetadata;
import javax.annotation.Generated;
import com.mysema.query.types.Path;
import com.mysema.query.types.path.PathInits;


/**
 * QCardRegister is a Querydsl query type for CardRegister
 */
@Generated("com.mysema.query.codegen.EntitySerializer")
public class QCardRegister extends EntityPathBase<CardRegister> {

    private static final long serialVersionUID = 577055775L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QCardRegister cardRegister = new QCardRegister("cardRegister");

    public final DatePath<java.util.Date> actionDate = createDate("actionDate", java.util.Date.class);

    public final NumberPath<java.math.BigDecimal> amount = createNumber("amount", java.math.BigDecimal.class);

    public final QBranchMaster branchMaster;

    public final StringPath cardHolderName = createString("cardHolderName");

    public final NumberPath<Integer> cardId = createNumber("cardId", Integer.class);

    public final StringPath cardNo = createString("cardNo");

    public final StringPath cardType = createString("cardType");

    public final DateTimePath<java.sql.Timestamp> createDate = createDateTime("createDate", java.sql.Timestamp.class);

    public final StringPath createUser = createString("createUser");

    public final StringPath deleteInd = createString("deleteInd");

    public final StringPath deleteReason = createString("deleteReason");

    public final StringPath passingAuthInd = createString("passingAuthInd");

    public final StringPath passingAuthRemark = createString("passingAuthRemark");

    public final QTransactionPayment transactionPayment;

    public final DateTimePath<java.sql.Timestamp> updateDate = createDateTime("updateDate", java.sql.Timestamp.class);

    public final StringPath updateUser = createString("updateUser");

    public final NumberPath<Integer> validMonth = createNumber("validMonth", Integer.class);

    public final NumberPath<Integer> validYear = createNumber("validYear", Integer.class);

    public QCardRegister(String variable) {
        this(CardRegister.class, forVariable(variable), INITS);
    }

    public QCardRegister(Path<? extends CardRegister> path) {
        this(path.getType(), path.getMetadata(), path.getMetadata().isRoot() ? INITS : PathInits.DEFAULT);
    }

    public QCardRegister(PathMetadata<?> metadata) {
        this(metadata, metadata.isRoot() ? INITS : PathInits.DEFAULT);
    }

    public QCardRegister(PathMetadata<?> metadata, PathInits inits) {
        this(CardRegister.class, metadata, inits);
    }

    public QCardRegister(Class<? extends CardRegister> type, PathMetadata<?> metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branchMaster = inits.isInitialized("branchMaster") ? new QBranchMaster(forProperty("branchMaster")) : null;
        this.transactionPayment = inits.isInitialized("transactionPayment") ? new QTransactionPayment(forProperty("transactionPayment"), inits.get("transactionPayment")) : null;
    }

}

