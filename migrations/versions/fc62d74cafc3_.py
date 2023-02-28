"""empty message

Revision ID: fc62d74cafc3
Revises: 24ddd7c982a7
Create Date: 2023-02-21 16:29:02.170810

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision = 'fc62d74cafc3'
down_revision = '24ddd7c982a7'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('sales_order', schema=None) as batch_op:
        batch_op.drop_column('client_credit')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('sales_order', schema=None) as batch_op:
        batch_op.add_column(sa.Column('client_credit', postgresql.DOUBLE_PRECISION(precision=53), autoincrement=False, nullable=True))

    # ### end Alembic commands ###
